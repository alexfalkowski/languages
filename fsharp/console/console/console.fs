open FSharp.Data

module Console =
    type Species = HtmlProvider<"http://en.wikipedia.org/wiki/The_world's_100_most_threatened_species">

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

    let printSpecies =
        let species = [ for x in Species.GetSample().Tables.``Species list``.Rows ->  x.Type, x.``Common name`` ]
        printfn "%A" species

[<EntryPoint>]
let main argv =
    Console.showWordCount "I love you you"
    Console.printSpecies
    0
