# odd-ghc-pattern-bug
Demonstrates a ghc bug in pattern matching on persistent types

This code is simplified from a non-trivial yesod site

Muse, Message and Folder are 3 of my persistent tables, so their actual
definitions come from Template Haskell in persistent-template

the functions receive a triple of 3 Entity values, which i want to pull apart
into its constituent keys and values

* if i do this in 2 steps (`fn2` in Message.hs) it all works as expected
* if i try to do it in a single step (`fn1`), compilation fails with these
  strange and unhelpful errors

        Message.hs:10:25:
            Couldn't match expected type ‘Message’ with actual type ‘Message’
            In the first argument of ‘messageName’, namely ‘msg’
            In the second argument of ‘($)’, namely ‘messageName msg’

        Message.hs:11:24:
            Couldn't match expected type ‘Folder’ with actual type ‘Folder’
            In the first argument of ‘folderName’, namely ‘fldr’
            In the expression: folderName fldr

i get the same error with ghc-7.8.3, -7.8.4, and -7.10.3
