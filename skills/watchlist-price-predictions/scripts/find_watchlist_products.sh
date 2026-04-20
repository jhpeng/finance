#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  find_watchlist_products.sh [--path FILE] [--enabled-only] [--symbols CSV] [--symbols-only]

Outputs rows from a watchlist YAML file with this schema:
  products:
    - symbol: SPY
      label: SPDR S&P 500 ETF Trust
      asset_class: etf
      enabled: true

Default format:
  symbol<TAB>label<TAB>asset_class<TAB>enabled

Options:
  --path FILE         Watchlist file. Defaults to repo_root/watchlists/products.yaml.
  --enabled-only      Emit only rows whose enabled field is true.
  --symbols CSV       Filter to a comma-separated list of symbols, case-insensitive.
  --symbols-only      Print only the symbol column.
  -h, --help          Show this help message.
EOF
}

watchlist_path=""
enabled_only=0
symbols_csv=""
symbols_only=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --path)
      watchlist_path="$2"
      shift 2
      ;;
    --enabled-only)
      enabled_only=1
      shift
      ;;
    --symbols)
      symbols_csv="$2"
      shift 2
      ;;
    --symbols-only)
      symbols_only=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/../../.." && pwd)"
resolved_path="${watchlist_path:-${repo_root}/watchlists/products.yaml}"

if [[ ! -f "$resolved_path" ]]; then
  printf 'Watchlist file not found: %s\n' "$resolved_path" >&2
  exit 1
fi

ENABLED_ONLY="$enabled_only" \
SYMBOLS_CSV="$symbols_csv" \
SYMBOLS_ONLY="$symbols_only" \
perl - "$resolved_path" <<'EOF'
use strict;
use warnings;

my $watchlist_path = shift @ARGV;
my $enabled_only = $ENV{ENABLED_ONLY} // 0;
my $symbols_csv = $ENV{SYMBOLS_CSV} // q{};
my $symbols_only = $ENV{SYMBOLS_ONLY} // 0;

open my $fh, '<', $watchlist_path or die "Failed to open watchlist: $watchlist_path\n";

my %wanted;
if ($symbols_csv ne q{}) {
    for my $symbol (split /,/, $symbols_csv) {
        $symbol =~ s/^\s+//;
        $symbol =~ s/\s+$//;
        next if $symbol eq q{};
        $wanted{ lc $symbol } = 1;
    }
}

my $in_products = 0;
my %row = ( enabled => 'true' );

sub clean_value {
    my ($value) = @_;
    $value =~ s/^\s+//;
    $value =~ s/\s+$//;

    if ($value =~ /^"(.*)"$/s || $value =~ /^'(.*)'$/s) {
        $value = $1;
    }

    return $value;
}

sub emit_row {
    my ($row_ref) = @_;
    return if !defined $row_ref->{symbol} || $row_ref->{symbol} eq q{};

    my $enabled = defined $row_ref->{enabled} ? lc $row_ref->{enabled} : 'true';
    return if $enabled_only && $enabled ne 'true';
    return if %wanted && !$wanted{ lc $row_ref->{symbol} };

    if ($symbols_only) {
        print $row_ref->{symbol}, "\n";
        return;
    }

    my $label = defined $row_ref->{label} ? $row_ref->{label} : q{};
    my $asset_class = defined $row_ref->{asset_class} ? $row_ref->{asset_class} : q{};
    print join("\t", $row_ref->{symbol}, $label, $asset_class, $enabled), "\n";
}

while (my $line = <$fh>) {
    chomp $line;

    next if $line =~ /^\s*#/;
    next if $line =~ /^\s*$/;

    if ($line =~ /^\s*products:\s*$/) {
        $in_products = 1;
        next;
    }

    next if !$in_products;

    if ($line =~ /^\s*-\s*([A-Za-z_][A-Za-z0-9_-]*)\s*:\s*(.*)$/) {
        emit_row(\%row);
        %row = ( enabled => 'true' );
        my ($field, $value) = ($1, clean_value($2));
        $row{$field} = $field eq 'enabled' ? lc $value : $value;
        next;
    }

    if ($line =~ /^\s+([A-Za-z_][A-Za-z0-9_-]*)\s*:\s*(.*)$/) {
        my ($field, $value) = ($1, clean_value($2));
        $row{$field} = $field eq 'enabled' ? lc $value : $value;
        next;
    }
}

emit_row(\%row);
EOF
