SnowballStemmer.jl
===============


The SnowballStemmer.jl package extracts the stemmer functionality of the `TextAnalysis.jl`.

The idea is to provide a simpler interface to stemming without forcing your programs to follow the
interfaces of `TextAnalysis.jl`, which is a great package but sometimes the text-modeling should
be different.

# Installation

The TextAnalysis package can be installed using Julia's package manager:
```
    Pkg.clone("repo-address")
```

# Getting Started

Just import the stemmer package and you are ready to work.

```julia

julia> using SnowballStemmer    	
```

Listing the available stemmers (supported languages)
```julia
julia> stemmer_types()
16-element Array{AbstractString,1}:
 "danish"    
 "dutch"     
 "english"   
 "finnish"   
 "french"    
 "german"    
 "hungarian"
 "italian"   
 "norwegian"
 "porter"    
 "portuguese"
 "romanian"  
 "russian"   
 "spanish"   
 "swedish"   
 "turkish"   

```

A stemmer is initialized as follows:
```julia
julia> s = Stemmer("spanish")
```
Then, use the `stem` function over each word

```julia
julia> [stem(s, text) for text in split("las casas de colores estan sobre las colinas")]
8-element Array{String,1}:
 "las"  
 "cas"  
 "de"   
 "color"
 "estan"
 "sobr"
 "las"  
 "colin"
```

As you may noticed, there is no integrated tokenizer; for most complex cases, you may create your own tokenizers, for simple cases you can use just regular expressions.

The following is an example of use for an English sentence:

```julia
julia> e = Stemmer("english")
SnowballStemmer.Stemmer(Ptr{Void} @0x00007fcbb253c6c0, "english", "UTF_8")

julia> [stem(e, x.match) for x in eachmatch(r"\w+", "browsing and searching are not equivalent; however, no body cares... surprised?")]
11-element Array{String,1}:
 "brows"  
 "and"    
 "search"
 "are"    
 "not"    
 "equival"
 "howev"  
 "no"     
 "bodi"   
 "care"   
 "surpris"
```

# Advanced manipulation of text
This package only provides stemming facilities. More advanced functionality can be found in `TextAnalysis.jl` or `TextModel.jl`
