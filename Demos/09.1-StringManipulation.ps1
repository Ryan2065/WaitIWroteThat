#string manipulation
$string = 'abc-TheStuffIwant0101abc'

#everything after abc- using substring
if($string.StartsWith('abc-')) {
    if($string.EndsWith('abc')) {
        $len = $string.Length
        $stuff = $string.Substring(4,$len-4)
        $whatIwant = $stuff.trim('0101')
    }
}

# why is this a bad idea? You make wild assumptions about the string.
# doing parsing with substring and $length without validating the string is unsafe.
# no real error checking. This is foolish error checking.
# what happens if the input changes?! Parsing strings like this is challenging to maintain # why do this in the first place?  regexes are scary times.  get over your fear.

$regex = '^abc-[A-Za-z+]{1,}[0-9]{4,}abc'
if($string -cmatch $regex) {
    $WhatIWant = $string.Replace('abc-','').Replace('0101abc','')
}

#Why is this better? The regex does all the error checking.
#less things to maintain if the code changes.
#regexs are a powerfull tool and worth learning.

#regexes should always be used when validating user input.
