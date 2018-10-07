#!/usr/bin/perl

#Nucleotides are in the same file that called 'Data'.
#Each nucleotide is in separate rows.
#Nucleotides should be written only in characters without hyphen and gaps.

open(DATA, "<Data.txt") or die "Can't open file called 'Data'";

@aminoacid1 = split('',<DATA>);
chomp(@aminoacid1);
print "Nucleotide 1: @aminoacid1\n";

@aminoacid2 = split('',<DATA>);
chomp(@aminoacid2);
print "Nucleotide 2: @aminoacid2\n";

close(DATA) or die "Couldn't close file called 'Data' properly";

print "\nPlease enter a sliding window size: ";
$window_size = <>;

print "Please enter a similarity cutoff: ";
$similarity_cutoff = <>;

print "\n";

$max_index1 = $#aminoacid1;
$max_index2 = $#aminoacid2;

unshift(@aminoacid1,"-");
pop(@aminoacid1);
push(@aminoacid1,"-");
#print "@aminoacid1\n";

unshift(@aminoacid2,"-");
push(@aminoacid2,"-");
#print "@aminoacid2\n";

my @matrix;

for($i = 0; $i <= $max_index1 + 1 ; $i = $i + 1)
{
   $matrix[0][$i] = @aminoacid1[$i];
}

print "\n";

for($j = 0; $j <= $max_index2 + 2; $j = $j + 1)
{
   $matrix[$j][0] = @aminoacid2[$j];
}

$middle_index = int($window_size/2);

for( $a = 0; $a < $max_index2+1; $a ++ )
{
   for( $b = 0; $b < $max_index1; $b ++ )
   {
       $similarity=0;
       for( $c = 0 ; $c < $window_size ; $c ++ )
       {
          if((@aminoacid2[$a+$c] eq @aminoacid1[$b+$c]) && (@aminoacid2[$a+$c] ne "-") && (@aminoacid1[$b+$c] ne "-"))
          {
             $similarity++;
             
             if($similarity == $similarity_cutoff)
             {   
               $matrix[$middle_index + $a][$middle_index + $b] = ".";
                
               for($j = 0; $j <= $max_index2 + 1; $j = $j + 1)
               {
                  for($i = 0; $i <= $max_index1 ; $i = $i + 1)
                  {
                     print "$matrix[$j][$i] ";
                  }
                  print "\n";
               }
               print "\n";
             }
          }
          
          else
          {
             $matrix[$middle_index + $a][$middle_index + $b] = " ";
          }          	
       }
   }
}