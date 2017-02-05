module Console

let splitAtSpaces(name: string) =
    name.Split ' '
    |> Array.toList

let wordCount text =
    let words = splitAtSpaces text
    let numWords = words.Length
    let distinctWords = List.distinct words
    let numDups = numWords - distinctWords.Length
    (numWords, numDups)

let showWordCount text =
    let numWords, numDups = wordCount text
    printfn "%d words in text" numWords
    printfn "%d duplicate words" numDups

[<EntryPoint>]
let main argv =
    showWordCount "I love you you"
    0 // return an integer exit code
