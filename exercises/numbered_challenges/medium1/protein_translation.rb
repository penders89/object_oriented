# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
 #UCU, UCC, UCA, UCG	Serine
#UAU, UAC	Tyrosine
#UGU, UGC	Cysteine
#UGG	Tryptophan
#UAA, UAG, UGA	STOP

class InvalidCodonError < StandardError
end

class Translation
  PROTEINS = { "AUG" => "Methionine" ,
               "UUU" => "Phenylalanine",
               "UUC" => "Phenylalanine",
               "UUA" => "Leucine",
               "UUG" => "Leucine",
               "UCU" => "Serine",
               "UCC" => "Serine",
               "UCA" => "Serine",
               "UCG" => "Serine",
               "UAU" => "Tyrosine",
               "UAC" => "Tyrosine",
               "UGU" => "Cysteine",
               "UGC" => "Cysteine",
               "UGG" => "Tryptophan",
               "UAA" => "STOP",
               "UAG" => "STOP",
               "UGA" => "STOP",
              }
  
  
  
  def self.of_codon(protein)
    if !PROTEINS.has_key? protein
        raise InvalidCodonError
    else
        PROTEINS[protein]
    end
  end
    
    
  def self.of_rna(str)
    proteins = []
    (str.length/3).times do |n|
      three_letters = str.chars[3*n..3*n+2].join
      translated = Translation.of_codon(three_letters)
      if translated == "STOP"
        return proteins
      else
        proteins << translated
      end
    end
    proteins
  end  

end

  
  
