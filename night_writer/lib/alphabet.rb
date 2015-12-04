module Alphabet

  English = {
              a: [["0."],[".."],[".."]],
              b: [["0."],["0."],[".."]],
              c: [["00"],[".."],[".."]],
              d: [["00"],[".0"],[".."]],
              e: [["0."],[".0"],[".."]],
              f: [["00"],["0."],[".."]],
              g: [["00"],["00"],[".."]],
              h: [["0."],["00"],[".."]],
              i: [[".0"],["0."],[".."]],
              j: [[".0"],["00"],[".."]],
              k: [["0."],[".."],[".0"]],
              l: [["0."],["0."],["0."]],
              m: [["00"],[".."],["0."]],
              n: [["00"],[".0"],["0."]],
              o: [["0."],[".0"],["0."]],
              p: [["00"],["0."],["0."]],
              q: [["00"],["00"],["0."]],
              r: [["0."],["00"],["0."]],
              s: [[".0"],["0."],["0."]],
              t: [[".0"],["00"],["0."]],
              u: [["0."],[".."],["00"]],
              v: [["0."],["0."],["00"]],
              w: [[".0"],["00"],[".0"]],
              x: [["00"],[".."],["00"]],
              y: [["00"],[".0"],["00"]],
              z: [["0."],[".0"],["00"]],
              cap: [[".."],[".."],[".0"]],
             }



  Braille = {
              31=>"a",
              23=>"b",
              15=>"c",
              11=>"d",
              27=>"e",
              7=>"f",
              3=>"g",
              19=>"h",
              39=>"i",
              35=>"j",
              30=>"k",
              21=>"l",
              13=>"m",
              9=>"n",
              25=>"o",
              5=>"p",
              1=>"q",
              17=>"r",
              37=>"s",
              33=>"t",
              28=>"u",
              20=>"v",
              34=>"w",
              12=>"x",
              8=>"y",
              24=>"z",
              62=>"cap"
            }


  def self.binary_transform
    braille_alphabet = {}
    English.each do |key,value|
      binary = value.flatten.join.gsub(".", "1")
      letter_number = binary.to_i(2)
      braille_alphabet[letter_number] = key.to_s
    end
    return braille_alphabet
  end
end
