Night Writer
============

Process
---------
1. How will you know the problem is solved?

- The function can translate braille to english and english to braille

2. How will it be used?

- To translate braille to english and vice versa on the terminal

3. What is the most trivial use case?

- Nothing

4. What is the minimum work case?

- A single letter

5. What is the next most complex case?

- A word
- A sentence
- Capital letters and lower case letters
- Numbers

6. Pseudocode

*Writer*

Input file extensions on terminal

$ writer.rb english.txt braille.txt

file = english.txt

characters = break down file into words then characters

convert character to symbol and grab braille via hash

then store grabbed braille into an array

write array into to braille.txt

*Reader*

Input file extensions on terminal

$ reader.rb braille.txt english.txt

file = braille.txt

put each column of braille into an array within an array

convert braille into binary

then use binary to find letters in a hash

then store grabbed letters into an array

write array into to english.txt

Writing numbers in english and braille

When a number is read in a REGEX will pick up the pattern. Once it is read in
a pound braille will be inserted into the baille. When a number is picked up
the code will go into a separate loop (putting in numbers from the number alphabet)
until a space is picked up.

Reading numbers from braille to english

when the braille # is read it will then place the braille reader into a separate
loop that will parse out numbers until a space shows up. Once a space shows up
the process will end

writing contractions

before text is processed contractions will be found and replaced with their braille
equivalent character ("but" would be "b"). Some contractions do not have a specific
letter representation. I may use capitalization or other ASCII equivalents. When
transforming all of the text to braille single letters (" b ") will be found using
each_with_index allowing for the code to look ahead one at a time.

capital letters will bring problems. 

reading contractions

single letter braille items will be found using each_with_index then sorted directly
into a different alphabet. This will can and will mess up the tally count. Tally
will need to be directly modified by the length of the contraction. This can be
accomplished by modifying tally and skipping it over. Or just adding 1 less then
the actually tally and let iteration count the final.
