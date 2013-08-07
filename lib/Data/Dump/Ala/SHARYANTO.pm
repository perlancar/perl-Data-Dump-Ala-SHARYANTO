package Data::Dump::Ala::SHARYANTO;

use 5.010001;
use strict;
use warnings;
use Data::Dump::Filtered qw();

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(dd);

# VERSION

sub dd {
    # dump_filtered always prints? unlike dd
    Data::Dump::Filtered::dump_filtered(
        @_,
        sub {
            my ($ctx, $oref) = @_;
            if ($ctx->class) {
                if ($oref->isa("DateTime")) {
                    return {dump => "\"$oref\"", comment => "DateTime object"};
                }
            } else {
                return;
            }
        }
    );
}

1;
# ABSTRACT: Use Data::Dump to dump data à la Steven Haryanto

=head1 SYNOPSIS

 use Data::Dump::Ala::SHARYANTO;
 dd(...);


=head1 DESCRIPTION

Everyone prefers their dumps differently. I picked Data::Dump::Ala::* namespace
for author-customized L<Data::Dump> routines.

This module dumps with L<DateTime> objects converted to strings, e.g.
"2011-10-19".

=cut


=head1 FUNCTIONS

=for Pod::Coverage dd

=head2 dd(...)

Dump one or more data structures.


=head1 SEE ALSO

L<Data::Dump>

=cut
