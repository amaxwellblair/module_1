require 'minitest/autorun'
require 'minitest/pride'

class Allergy


  Allergy = {
  1 =>"eggs",
  2 => "peanuts",
  4 => "shellfish",
  8 =>"strawberries",
  16 =>"tomatoes",
  32 =>"chocolate",
  64 =>"pollen",
  128 => "cats"

  }

  def allergens(num)


    binary = num.to_s(2)
    allergy_arr = []
    binary.each_char do |bin|

    binary.each_char.with_index do |bin, i|
      hsh_num = (bin + "0"*i).to_i(2)
      allergy_arr << Allergy[hsh_num]
    end
    allergy_arr
  end
end

x = Allergy.new
puts x.allergens(2)
puts x.allergens(3)


class AllergyTest < Minitest::Test

 def test_score_one_is_egg_allergy
   allergy = Allergy.new
   expected = ['eggs']
   assert_equal expected, allergy.allergens(1)
 end

 def test_score_two_is_peanut_allergy
   allergy = Allergy.new
   expected = ['peanuts']
   assert_equal expected, allergy.allergens(2)
 end

 def test_score_three_is_eggs_and_peanuts
   allergy = Allergy.new
   expected = ['eggs', 'peanuts']
   assert_equal expected, allergy.allergens(3)
 end

 def test_has_all_allergies
  allergy = Allergy.new
  expected = ["cats", "chocolate", "eggs", "peanuts", "pollen", "shellfish", "strawberries", "tomatoes"]
  assert_equal expected, allergy.allergens(255)
  end

  def test_score_twofortyeight_has_five_allergies
    allergy = Allergy.new
    expected = ["cats", "chocolate", "pollen", "strawberries", "tomatoes"]
    assert_equal expected, allergy.allergens(248)
  end

end
