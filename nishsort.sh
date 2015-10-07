#!/bin/bash

# Get the possible (optional) command-line option "-ag" coming in, and
# store it in cmdLineOpt. If present, command line option "-ag" will
# align the graphemes in the final sorted output. (You can check out
# the final lines of code in this bash script for -ag's actual usage.)
# From the command line: bash nishsort.sh -ag
while [[ $# > 0 ]]; do cmdLineOpt="$1"; shift; done



########################
# Beginning of subshell
########################
(

# Disregarding carons (ǧ, ȟ and ǩ), these are all of the Nishnaabe
# graphemes:
# - ' a aa b ch d e g h i ii j k
# m mb n nd ng nh nj ns ny nz nzh
# o oo p s sh shk sht sk t w y z zh
#
#
# Including carons (ǧ, ȟ and ǩ), these are all of the Nishnaabe
# graphemes:
# - ' a aa b ch cȟ d e g ǧ h ȟ i ii j k ǩ
# m mb n nd ng nǧ nh nȟ nj ns ny nz nzh nzȟ
# o oo p s sh sȟ shk shǩ sht sk sǩ t w y z zh zȟ


# Read each line of the piped-in file into string variable singleLine.
# Then, translate each line into all lowercase. Then, assign each
# translated line to an element of array nishWords.
lineNum=$((0))
while read singleLine; do
    lowercaseLine="$(tr [A-Z] [a-z] <<< "$singleLine")"
    nishWords[lineNum]=$lowercaseLine
    lineNum=$((lineNum + 1))
done


############
# Functions
############

# This function accepts an array of graphemes as its first parameter, and
# a string as its second parameter. If the string is present in the array
# of graphemes, this function returns "True". Otherwise, this function
# returns "False".
function isItInTheArray()
{
    # We expect the first parameter to be an array of possible graphemes.
    param1=$1[@]

    # We expect the second parameter to be a string.
    param2="$2"

    # Assign the incoming array to possibleGraphemesArray. And, assign
    # the incoming string to stringToQueryFor.
    possibleGraphemesArray=("${!param1}")
    stringToQueryFor=$param2

    # Initialize to "False" the function's reply.
    theReply="False"

    # Iterate through possibleGraphemesArray searching for stringToQueryFor.
    for possibleGrapheme in "${possibleGraphemesArray[@]}" ; do

        # If stringToQueryFor matches any element of possibleGraphemesArray,
        # set theReply to "True", then break from the if statement.
        if [ "$stringToQueryFor" == "$possibleGrapheme" ]; then
            theReply="True"
            break
        fi

    done

    # Return the "True" or "False" value that's been determined.
    echo "$theReply"
}




##############################
# Begin main processing loop.
##############################

# Array of possible single-letter-graphemes in Pic River's dialect
# of the Nishnaabe language.
singleCharGraphemes=("-" "'" "a" "b" "d" "e" "g" "ǧ" "h" "ȟ" "i" "j"
                     "k" "ǩ" "l" "m" "n" "o" "p" "s" "t" "w" "y" "z")

# Array of possible two-letter-graphemes in Pic River's dialect
# of the Nishnaabe language.
digraphs=("aa" "ch" "cȟ" "ii" "mb" "nd" "ng" "nǧ" "nh" "nȟ" "nj"
          "ns" "ny" "nz" "oo" "sh" "sȟ" "sk" "sǩ" "zh" "zȟ")

# Array of possible three-letter-graphemes in Pic River's dialect
# of the Nishnaabe language.
trigraphs=("nzh" "nzȟ" "shk" "shǩ" "sht")

# Begin iterating through each Nishnaabe word in the nishWords array.
for nishWord in ${nishWords[@]}; do

    # Get length of Nishnaabe word currently being traversed through.
    lengthOfNishWord=${#nishWord}

    # We're preventing our quick-and-convenient three- and two-character
    # strings (queried3Chars and queried2Chars) from looking like
    # legitimate grapheme sequences as we traverse through the current
    # Nishnaabe word. We're accomplishing this by appending nonsense,
    # non-possible characters to the end of nishWord. The number of these
    # nonsense characters which we're tacking onto nishWord is one less
    # than the longest possible grapheme in Pic River's dialect (i.e.,
    # 3 - 1, or 2). Hence the two q-characters with which we're extending
    # nishWord.
    extendedNishWord=$nishWord"qq"

    # Begin traversing through the current Nishnaabe word, remaking it
    # into a sortable-by-grapheme string.
    i=$((0))
    remadeToBeSortable=""
    isUnrecognizable="False"
    while [ $i -lt $lengthOfNishWord ]; do

        # From the current counter, i, with which we're traversing
        # through the current Nishnaabe word, nishWord, we create three
        # quick and convenient strings from extendedNishWord with which
        # to do some querying in the upcoming lines of code.
        queried3Chars=${extendedNishWord:$i:3}
        queried2Chars=${extendedNishWord:$i:2}
        queried1Char=${extendedNishWord:$i:1}

        # Is the three-character sequence, beginning from the current
        # position i in nishWord, a possible Nishnaabe grapheme? If so,
        # we append this grapheme (with its accompanying alignment
        # character "|") to remadeToBeSortable, which holds each
        # newly-rebuilt sortable-by-grapheme Nishnaabe word. We then
        # advance by three the character counter i which is traversing
        # through nishWord's constituent characters.
        if [ $( isItInTheArray trigraphs "$queried3Chars" ) == "True" ]; then
            remadeToBeSortable=$remadeToBeSortable"|"$queried3Chars
            i=$((i + 3))

        # Is the two-character sequence, beginning from the current
        # position i in nishWord, a possible Nishnaabe grapheme? If so,
        # we append this grapheme (with its accompanying alignment
        # character "|" and sort-facilitation character "9") to
        # remadeToBeSortable, which holds each newly-rebuilt
        # sortable-by-grapheme Nishnaabe word. We then advance by two
        # the character counter i which is traversing through nishWord's
        # constituent characters.
        elif [ $( isItInTheArray digraphs "$queried2Chars" ) == "True" ]; then
            remadeToBeSortable=$remadeToBeSortable"|"$queried2Chars"9"
            i=$((i + 2))

        # Is the one-character sequence, beginning from the current
        # position i in nishWord, a possible Nishnaabe grapheme? If so,
        # we append this grapheme (with its accompanying alignment
        # character "|" and sort-facilitation characters "99") to
        # remadeToBeSortable, which holds each newly-rebuilt
        # sortable-by-grapheme Nishnaabe word. We then advance by one
        # the character counter i which is traversing through nishWord's
        # constituent characters.
        elif [ $( isItInTheArray singleCharGraphemes "$queried1Char" ) == "True" ]; then
            remadeToBeSortable=$remadeToBeSortable"|"$queried1Char"99"
            i=$((i + 1))

        # Alert user of an unrecognizable character within the Nishnaabe
        # word currently being traversed through. Flag the current
        # Nishnaabe word as containing an unrecognizable character in
        # order to prevent the display of a nonsense/blank line (i.e.,
        # remadeToBeSortable) in the final sorted output. Break out of
        # the current while loop which is traversing through the
        # current Nishnaabe word.
        else
            echo "9999****Unrecognizable character in: $nishWord"
            isUnrecognizable="True"
            break

        fi
    done

    # If the newly-remade sortable-by-grapheme Nishnaabe word is free
    # of unrecognizable characters, then output the sortable-by-grapheme
    # Nishnaabe word.
    if [ "$isUnrecognizable" == "False" ]; then
        echo $remadeToBeSortable
    fi

    # Reinitialize remadeToBeSortable to an empty string, and
    # isUnrecognizable to "False", in preparation for the creation of
    # the next sortable-by-grapheme Nishnaabe word which we'll shortly
    # be putting together.
    remadeToBeSortable=""
    isUnrecognizable="False"

done

##################
# End of subshell
##################
#
# And, allow for additional pipe commands.
) |


# Sort the sortable-by-grapheme list of Nishnaabe words.
#
# And, allow for additional pipe commands.
sort |

# If command line option "-ag" is not present, then output each
# Nishnaabe word as it would normally appear by removing all
# occurrences of "|" and "9" which were used to sort the sortable-
# by-grapheme versions of all the Nishnaabe words.
if [ "$cmdLineOpt" != "-ag" ]; then
    sed 's/[\||9]//g'

# However, if command line option "-ag" is indeed present (i.e., if
# the user wishes the output to be aligned by grapheme), then allow
# the "|" to remain in the output, and change the "9" to a "." for
# increased readability of the grapheme-aligned output.
else
    sed 's/[9]/./g'

fi
