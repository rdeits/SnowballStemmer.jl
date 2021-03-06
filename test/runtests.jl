module TestTextAnalysis
    using Base.Test
    using SnowballStemmer

    my_tests = [
        "stemmer.jl",
    ]

    println("Running tests:")

    for my_test in my_tests
        println(" * $(my_test)")
        include(my_test)
    end
end
