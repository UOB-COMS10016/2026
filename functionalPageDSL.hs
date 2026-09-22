{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# OPTIONS_GHC -Wincomplete-patterns #-}

{-# HLINT ignore "Evaluate" #-}

module Main where

import Data.List (nub, sortOn)
-- cabal install --lib containers --package-env .
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
import Text.Printf (printf)

main :: IO ()
main = putStr $ pageToJS functionalPage config

config :: Config
config =
  MkConfig
    { currentWeek = 1,
      activityNum = 8,
      columnNum = 4,
      title = "FUNCTIONAL PROGRAMMING",
      headerOn = True,
      header1 = "EXERCISES",
      header2 = "LECTURES",
      header3 = "COURSEWORK",
      inactColour = "#999999",
      titleColour = "#777777",
      titleBColour = "#BBBBBB",
      bkgColour = "#CCCCCC",
      embossColour = "#AAAAAA",
      fontSizePix = 11
    }

functionalPage :: Page -- a.k.a. [Week], a.k.a [[GridEntry]]
functionalPage =
  [ -- Week 1
    [ Entry
        { title = "",
          spec = ExtraMaterials,
          materials =
            [ -- external "Guest seminar VOD: Haskell in the Datacentre" "https://web.microsoftstream.com/video/17f0fbf7-461c-4cf1-937f-21e8407a137e"
              -- , external "Paper: How functional programming mattered" "https://mengwangoxf.github.io/Papers/NSR15.pdf"
              external "Bristol PL Research Group" "https://plrg-bristol.github.io/"
            ]
        },
      Entry
        { title = "Introduction + Expressions and Evaluation",
          spec =
            Lecture
              { slot = First,
                slidesFile' = Right (External "https://docs.google.com/presentation/d/1DiapOoijfu_mNmz7vajflsmM7kC2c4-IdmqEzG0nKRM"),
                lectureRecording = Nothing
              },
          materials =
            [ -- external "Welcome to Functional Programming Slides" "https://docs.google.com/presentation/d/1MKHf1CZkwJsLV3uAFo5z_BxJaFF6kmA1Vuc6TKloAjM/edit?usp=sharing"
              misc "Roadmap.pdf"
            , code "ExpressionsLive-v0.1.hs"
            , minSheet "https://forms.cloud.microsoft/e/w1iprVsbWX"
            ]
        },
      Entry
        { title = "Expressions and Evaluation (cont.)",
          spec =
            Lecture
              { slot = Second,
                slidesFile' = Left "2026-09-28", -- Right (BBCode "ExpressionsBP.hs"),
                lectureRecording = Nothing -- Just "https://mediasite.bris.ac.uk/Mediasite/Play/e8988639f39144fe870cde47f75b90671d"
              },
          materials =
            [ -- code "ExpressionsBP.hs"
            -- , code "ExpressionsLive.hs"
              minSheet "https://forms.cloud.microsoft/e/QZ62B9rgG8"
            ]
        },
      Entry
        { title = "GET YOUR PC READY",
          spec = SetupLab {setupLink = "./setup.html"},
          materials = []
        }
    ],
    -- Week 2
    -- [ Entry
    --     { title = "Pattern Matching and Recursion",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "PatternsAndRecursionBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/e1f29257460e4182bd80fa64a623fe3f1d"
    --           },
    --       materials =
    --         [ code "PatternsAndRecursionBP.hs"
    --         , code "PatternsAndRecursionLive.hs"
    --         , minSheet "https://forms.cloud.microsoft/e/2WYXgw55gE"
    --         ]
    --     },
    --   Entry
    --     { title = "Types",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "Types.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/8b31499164f14e8eb9429ee6e79c469b1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/BpZuXP2fVc"
    --         , code "TypesLive.hs"
    --         , code "TypesTemplate.hs"
    --         , code "TypesBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Basic Programming",
    --       spec = Worksheet "sheet01.pdf",
    --       materials = sheets 1 ++ answers 1
    --     }
    -- ],
    -- -- Week 3
    -- [ Entry
    --     { title = "History of Haskell",
    --       spec = History,
    --       materials =
    --         [ note "History of Haskell" "HistoryOfHaskell.pdf",
    --           note "How Functional Programming Mattered" "HowFPMattered.pdf"
    --         ]
    --     },
    --   Entry
    --     { title = "Lists",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "ListsPatternMatchingBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/a17919b245bf4b7fb6e8fc1a030cd6e81d"
    --           },
    --       materials =
    --         [ code "ListsPatternMatchingBP.hs"
    --         , code "ListsPatternMatchingLive.hs"
    --         , minSheet "https://forms.cloud.microsoft/e/6fkHNR7iaW"
    --         ]
    --     },
    --   Entry
    --     { title = "ADTs, Polymorphism and Type Classes",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "ADTsPolymorphismTypeClassesLive.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/6ff54ed428af4d1b9d25ea70135c572e1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/6fkHNR7iaW"
    --         , code "ADTsPolymorphismTypeClassesLive.hs"
    --         , code "ADTsTemplate.hs"
    --         , code "ADTsBP.hs"
    --         , code "PolymorphismTemplate.hs"
    --         , code "PolymorphismBP.hs"
    --         , code "TypeClassesTemplate.hs"
    --         , code "TypeClassesBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Lists",
    --       spec = Worksheet "sheet02.pdf",
    --       materials = sheets 2 ++ answers 2
    --     }
    -- ],
    -- -- Week 4
    -- [ Entry
    --     { title = "ADTs, Polymorphism and TypeClasses cont.",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "ADTsPolymorphismTypeClassesLive.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/e0ac0f0e335d4589a517c97906c67aa61d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/p70YZ9AvMK"
    --         , code "ADTsPolymorphismTypeClassesLive.hs"
    --         , code "ADTsTemplate.hs"
    --         , code "ADTsBP.hs"
    --         , code "PolymorphismTemplate.hs"
    --         , code "PolymorphismBP.hs"
    --         , code "TypeClassesTemplate.hs"
    --         , code "TypeClassesBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Higher-Order Functions",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "HOLive.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/08b75ad11e4a40799af16ad46219723e1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/szsFDhzxzC"
    --         , code "HOLive.hs"
    --         , code "HOtemplate.hs"
    --         , code "HObp.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "ADTs, Polymorphism and TypeClasses",
    --       spec = Worksheet "sheet03.pdf",
    --       materials = sheets 3 ++ answers 3
    --     },
    --   Entry
    --     { title = "Power to the People",
    --       spec =
    --         Coursework
    --           { instructions = "CW1/CW1-Instrs.pdf",
    --             submissionLink = "https://www.ole.bris.ac.uk/ultra/courses/_264153_1/outline",
    --             deadline = "Noon, Tues 04/11/25"
    --           },
    --       materials =
    --         map
    --           (coursework "CW1")
    --           [ "CW1-Instrs.pdf",
    --             "CW1-InstrsDyslexic.pdf",
    --             "CW1-PowerToThePeople.zip"
    --           ]
    --     }
    -- ],
    -- -- Week 5
    -- [ Entry
    --     { title = "Higher-Order Functions cont. + Laziness Intro",
    --       spec =
    --         Lecture
    --           { slot = Other "Mon 10:00-10:50<br/><u><b>PRIORY RD COMPLX LT</b></u>",
    --             slidesFile' = Right (BBCode "HOLive.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/1cc5a03904124b5394267386be7c6b231d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/5LyvfU8eUu"
    --         , code "HOLive.hs"
    --         , code "HOtemplate.hs"
    --         , code "HObp.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Folds",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "FoldsPart1BP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/0c25e462134346d5a8a51a03c300b95c1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/0TFiDaNH9J"
    --         , code "FoldsPart1BP.hs"
    --         , code "FoldsPart1Template.hs"
    --         , code "FoldsPart1Live.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "HO Programming and Laziness",
    --       spec = Worksheet "sheet04.pdf",
    --       materials = sheets  4
    --                ++ answers 4
    --                ++ [sheet "sheetLazy.pdf",  sheet "sheetLazyDyslexic.pdf"]
    --                ++ [sheet "answerLazy.pdf", sheet "answerLazyDyslexic.pdf"]
    --     },
    --   Entry
    --     { title = "Structural Inductive Proofs",
    --       spec = WorksheetBonus "sheetBonus1.pdf",
    --       materials = sheetsBonus 1 ++ [note "Structural Inductive Proofs" "StructuralInductiveProofs.pdf"] ++ answersBonus 1
    --     }
    -- ],
    -- -- Reading week
    -- [],
    -- -- Week 7
    -- [ Entry
    --     { title = "Folds cont.",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "FoldsPart2BP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/eb4ecdeefcff41d9b3b2abc4e83d38c31d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/RDDRdr688j"
    --         , code "FoldsPart2BP.hs"
    --         , code "FoldsPart2Template.hs"
    --         , code "FoldsPart2Live.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Functor",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "FunctorBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/491661c7f706461a979d45347d286e9a1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/vKdE4rXTkw"
    --         , code "FunctorLive.hs"
    --         , code "FunctorTemplate.hs"
    --         , code "FunctorBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "",
    --       spec = NotesExtra,
    --       materials =
    --         map
    --           (uncurry note)
    --           [ ("Prelude Functions Cheatsheet", "PreludeFunctionsCheatsheet.pdf")
    --           ]
    --     },
    --   Entry
    --     { title = "Folding",
    --       spec = Worksheet "sheet05.pdf",
    --       materials = sheets 5 ++ answers 5
    --     },
    --   Entry
    --     { title = "Sudoku",
    --       spec = FormativePractical "Sudoku/SudokuInstrs.pdf",
    --       materials =
    --         map
    --           (coursework "Sudoku")
    --           [ "SudokuInstrs.pdf",
    --             "SudokuInstrsDyslexic.pdf",
    --             "Sudoku.hs",
    --             "hard.txt"
    --           ]
    --     }
    -- ],
    -- -- Week 8
    -- [ Entry
    --     { title = "Parsers",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "ParsersTemplate.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/1ef73f2313204762a9334b09011735801d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/d7Sv7F7kPF"
    --         , code "ParsersLive.hs"
    --         , code "ParsersTemplate.hs"
    --         , code "ParsersBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Applicatives",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "ApplicativeTemplate.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/a98978fda34a4af6a46a542456c394361d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/iacb4N8pbh"
    --         , code "ApplicativeLive.hs"
    --         , code "ApplicativeTemplate.hs"
    --         , code "ApplicativeBP.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Binary Trees with Alex Kavvos",
    --       spec =
    --         LectureExtra
    --           { videoLink = "https://mediasite.bris.ac.uk/Mediasite/Play/b3fcbbfaf52a4ea0a850d131b088c8ac1d"
    --           },
    --       materials = []
    --     },
    --   Entry
    --     { title = "",
    --       spec = NotesExtra,
    --       materials =
    --         [ note "How to Design \"Co\"-Programs" "copro.pdf",
    --           external "Design Patterns as Higher-Order Datatype-Generic Programs" "https://www.cs.ox.ac.uk/jeremy.gibbons/publications/hodgp-journal.pdf"
    --         ]
    --     },
    --   Entry
    --     { title = "Functors and Parsers",
    --       spec = Worksheet "sheet06.pdf",
    --       materials = sheets 6 ++ answers 6
    --     }
    --     ,
    --   Entry
    --     { title = "Simplify",
    --       spec =
    --         Coursework
    --           { instructions = "CW2/CW2-Instrs.pdf",
    --             submissionLink = "https://www.ole.bris.ac.uk/ultra/courses/_264153_1/outline",
    --             deadline = "Noon, Thurs 27/11/25<br/>(submit at least 1 hour early)"
    --           },
    --       materials =
    --         map
    --           (coursework "CW2")
    --           [ "CW2-Instrs.pdf",
    --             "CW2-InstrsDyslexic.pdf",
    --             "CW2-Simplify.zip"
    --           ]
    --     }
    -- ],
    -- -- Week 9
    -- [ Entry
    --     { title = "Applicatives cont.",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "ApplicativeChessParsingBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/35dc3f438d8148c6b6ddec46dd280c8a1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/9Hd3RVV27R"
    --         , code "ApplicativeLive.hs"
    --         , code "ApplicativeTemplate.hs"
    --         , code "ApplicativeBP.hs"
    --         , code "ApplicativeChessParsingBP.hs"
    --         , code "ApplicativeChessParsingLive.hs"
    --         , code "ApplicativeChessParsingTemplate.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "IO",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (BBCode "IOBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/062d4c1d1b504f4799c9d0c255dd0a3f1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/pkByWDsxVn"
    --         , code "IOBP.hs"
    --         , code "IOLive.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Applicative Parsing",
    --       spec = Worksheet "sheet07.pdf",
    --       materials = sheets 7 ++ [MkMaterial "Skeleton code" (sheetLink "Sheet7Skeleton.hs")] ++ answers 7
    --     },
    --   Entry
    --     { title = "Monoids",
    --       spec = WorksheetBonus "sheetBonus2.pdf",
    --       materials = sheetsBonus 2 ++ [note "Monoids notes" "Monoids.pdf"] ++ answersBonus 2
    --     }
    -- ],
    -- -- Week 10
    -- [ Entry
    --     { title = "IO Cont. (Katamari Haskacy)",
    --       spec =
    --         Lecture
    --           { slot = First,
    --             slidesFile' = Right (BBCode "KatamariHaskacyBP.hs"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/f185786896274e328a172000e5d4c6fd1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/Q8rH5TSGCa"
    --         , code "MinSheetLecture16.hs"
    --         , code "KatamariHaskacyBP.hs"
    --         , code "KatamariHaskacyTemplate.hs"
    --         ]
    --     },
    --   Entry
    --     { title = "Functor and Applicative Power Scaling",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (External "https://wayground.com/join?gc=60715962"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/b4130a3e72e04b1dac534b1efb6038421d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/fJHcHfLUsz"
    --         , external "Functor and Applicative slides + quiz" "https://wayground.com/join?gc=60715962"
    --         ]
    --     },

    --   Entry
    --     { title = "IO",
    --       spec = Worksheet "sheet08.pdf",
    --       materials = sheets 8 ++ answers 8
    --     },
    --   Entry
    --     { title = "Maps, Tries, Sets, and Perfect Trees",
    --       spec = WorksheetBonus "sheetBonus3.pdf",
    --       materials = note "Data.Map" "DataMap.pdf" : sheetsBonus 3 ++ answersBonus 3
    --     }
    -- ],
    -- -- Week 11
    -- [ Entry
    --     { title = "Mock Test",
    --       spec = MockTest {test = noteLink "mock.pdf"},
    --       materials =
    --         map
    --           note'
    --           [ "mock.pdf"
    --           , "mock-answers.pdf"
    --           ]
    --     },
    --   Entry
    --     { title = "Monad Power Scaling",
    --       spec =
    --         Lecture
    --           { slot = Other "Mon 10:00-10:50<br/><u><b>PRIORY RD COMPLX LT</b></u>",
    --             slidesFile' = Right (External "https://wayground.com/join?gc=43039994"),
    --             lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/41f1261416714e4cb705dba6674ed55e1d"
    --           },
    --       materials =
    --         [ minSheet "https://forms.cloud.microsoft/e/jscNkH3f5Z"
    --         , external "Monads slides + quiz" "https://wayground.com/join?gc=43039994"
    --         ]
    --     },
    --   --   external "Functors and Applicatives slides + quiz"
    --   --            "https://quizizz.com/admin/presentation/619be26fa9afb8001d4e68fa"
    --   -- , code "ApplicativeLive2023.hs"

    --   Entry
    --     { title = "Mock Test (interactive quiz)",
    --       spec =
    --         Lecture
    --           { slot = Second,
    --             slidesFile' = Right (External $ "https://wayground.com/join?gc=59581434"),
    --             lectureRecording = Nothing -- Just "https://"
    --           },
    --       materials =
    --         [ external "Mock quiz" "https://wayground.com/join?gc=59581434"
    --         , note' "interactive-mock-sheet-with-answers.pdf"
    --         ]
    --     },
    --   Entry
    --     { title = "Monads",
    --       spec = Worksheet "sheet09.pdf",
    --       materials = sheets 9 ++ answers 9 -- ++ [sheet "Grogu.hs"]
    --     }
    -- ],
    -- Week 12/revision week
    [
      --   Entry
      --     { title = "Mock Test Walkthrough"
      --     , spec =
      --       Lecture
      --         { slot = First
      --         , slidesFile' = Right (External $ noteLink "COMS10016-Mock.pdf")
      --         , lectureRecording = Nothing
      --         }
      --     , materials =
      --         [ note' "COMS10016-Mock.pdf"
      --         , note' "COMS10016-Mock-answers.pdf"
      --         ]
      --     }
      -- , Entry
      --     { title = "Functor/Applicative recap and Quiz + Q&A"
      --     , spec = Lecture
      --         { slot = Second
      --         , slidesFile' = Right (External "https://quizizz.com/admin/presentation/619be26fa9afb8001d4e68fa")
      --         , lectureRecording = Nothing
      --         }
      --     , materials =
      --         [ external "Functors and Applicatives slides + quiz"
      --                     "https://quizizz.com/admin/presentation/619be26fa9afb8001d4e68fa"
      --         ]
      --     }
        -- Entry
        --   { title = "Revision of previous sheets"
        --   , spec = Worksheet "sheet09.pdf"
        --   , materials = []
        --   }
      -- , Entry
      --     { title = "Sheet of Death"
      --     , spec = WorksheetBonus "sheetBonus4.pdf"
      --     , materials = sheetsBonus 4 -- ++ answersBonus 4
      --     }
      ],

    -- Spare couple weeks of lectures, to make sure site doesn't break
    [],
    []
  ]

---------------------------------------------------------------------
-- Specifying Categories for Entry types
---------------------------------------------------------------------

entryToCategory :: GridEntry -> Category
entryToCategory (Entry _ details materials) = case details of
  SetupLab {} -> simpleCat "Setup Lab:" "#EEEEDD"
  Lectures {..} ->
    MkCat
      { title = "Lectures",
        colour = "#CCCFFF",
        counter = False,
        slidesLinkName = "",
        materialLinkName =
          if not (null materials)
            then "Materials"
            else ""
      }
  Lecture {..} ->
    MkCat
      { title = "Lecture",
        colour = "#CCCFFF",
        counter = False,
        slidesLinkName = case lectureRecording of
          Just _ -> "Lecture Recording"
          _ -> "",
        materialLinkName =
          if not (null materials)
            then "Materials"
            else ""
      }
  LectureExtra {..} ->
    MkCat
      { title = "Bonus Lecture",
        colour = "#D8CCFF",
        counter = False,
        slidesLinkName = "",
        materialLinkName =
          if not (null materials)
            then "Materials"
            else ""
      }
  ExtraMaterials ->
    MkCat
      { title = "Extra Materials",
        colour = "#DDDDDD",
        counter = False,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  Worksheet {} ->
    MkCat
      { title = "Worksheet",
        colour = "#EEEEDD",
        counter = True,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  WorksheetBonus {} ->
    MkCat
      { title = "Bonus Worksheet",
        colour = "#EEEEDD",
        counter = True,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  NotesExtra ->
    MkCat
      { title = "Bonus Material",
        colour = "#94e5bf",
        counter = False,
        slidesLinkName = "",
        materialLinkName = "Material"
      }
  History ->
    MkCat
      { title = "History",
        colour = "#EEEEDD",
        counter = False,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  Coursework {submissionLink} ->
    MkCat
      { title = "Coursework",
        colour = "#FCC981",
        counter = False, -- Doesn't seem to be working for some reason
        slidesLinkName =
          if not (null submissionLink)
            then "Submit on Blackboard"
            else "",
        materialLinkName = "Materials"
      }
  FormativePractical {} ->
    MkCat
      { title = "Formative Practical",
        colour = "#EEEEDD",
        counter = True,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  MockTest {test} ->
    MkCat
      { title = "Mock Test",
        colour = "#EEEEDD",
        counter = False,
        slidesLinkName = "",
        materialLinkName = "Materials"
      }
  _ -> blankCategory

isLectureCategory :: EntrySpec -> Bool
isLectureCategory x = case x of
  Lectures {} -> True
  Lecture {} -> True
  NotesExtra {} -> True
  LectureExtra {} -> True
  _ -> False

isCourseworkCategory :: EntrySpec -> Bool
isCourseworkCategory x = case x of
  Worksheet {} -> True
  WorksheetBonus {} -> True
  SetupLab {} -> True
  Coursework {} -> True
  FormativePractical {} -> True
  _ -> False

blankCategory :: Category
blankCategory =
  MkCat
    { title = "",
      colour = "#CCCCCC",
      counter = False,
      slidesLinkName = "",
      materialLinkName = ""
    }

---------------------------------------------------------------------
-- Specifying Entry to Activity transformation
---------------------------------------------------------------------

entryToActivity :: CategoryDict -> GridEntry -> Activity
entryToActivity catDict entry@(Entry {title, spec, materials}) =
  MkActivity
    { categoryNum = catDict M.! entryToCategory entry, -- Slightly unsafe
      dateTime = case spec of
        ExtraMaterials -> "(optional)"
        History -> "(optional)"
        SetupLab {} -> "Mon 21/09/26<br/>15:00-18:00<br/>Wed 23/09/26<br/>9:00-11:00<br/>MVB2.11/2.34/1.15"
        Worksheet {} -> "Wed 9:00-11:00<br/>MVB2.11/2.34/1.15"
        WorksheetBonus {} -> "(optional)"
        Lectures {} -> "Tues 15:00-17:00<br/>Thur 15:00-16:00"
        Lecture {slot} -> case slot of
          First -> "Tues 15:00-17:00<br/>CHEM BLDG LT1"
          Second -> "Thur 15:00-16:00<br/>CHEM BLDG LT1"
          Other s -> s
        LectureExtra {} -> "(optional)"
        NotesExtra -> "(optional)"
        Coursework {..} -> "Deadline: " ++ deadline
        FormativePractical {} -> ""
        MockTest {} -> "in your own time"
        _ -> "",
      title = case spec of
        Lectures {slidesFile, revisionVideos} ->
          titleWithSlidesAndVideos title (Just slidesFile) revisionVideos
        -- Lecture{slidesFile', revisionVideo}
        --   -> titleWithSlidesAndVideos title slidesFile' revisionVideo
        _ -> title,
      activityURL = case spec of
        SetupLab {setupLink} -> setupLink
        Worksheet {file} -> sheetLink file
        WorksheetBonus {file} -> sheetLink file
        Coursework {instructions} -> courseworkLink instructions
        FormativePractical {file} -> courseworkLink file
        LectureExtra {videoLink} -> videoLink
        Lecture {slidesFile'} -> either notYetImplemented slidesPathToUrl slidesFile'
        MockTest {test} -> test
        _ -> "",
      slidesURL = case spec of
        Coursework {submissionLink} -> submissionLink
        Lecture {lectureRecording} -> case lectureRecording of
          Just revVid -> revVid
          _ -> ""
        _ -> "",
      materialStart = 0,
      materialRange = length materials
    }

titleWithSlidesAndVideos :: String -> Maybe SlidesPath -> [URL] -> [Char]
titleWithSlidesAndVideos title slidesFile revisionVideos =
  ( case slidesFile of
      Nothing -> title
      Just slides -> href title (slidesPathToUrl slides)
  )
    ++ revisionVidLinks revisionVideos

href :: String -> URL -> String
href text link = printf "<a href='%s' target='_blank'>%s</a>" link text

revisionVidLinks :: [URL] -> String
revisionVidLinks vids =
  zipWith f [1 ..] vids
    |> concat
  where
    f :: Int -> URL -> String
    f i link = "<br/>(" ++ href ("Revision Video " ++ show i) link ++ ")"

---------------------------------------------------------------------
-- Types API
---------------------------------------------------------------------

data GridEntry = Entry
  { title :: String,
    spec :: EntrySpec,
    materials :: [Material]
  }
  deriving (Show, Eq)

data EntrySpec
  = ExtraMaterials
  | Lectures
      { slidesFile :: SlidesPath,
        revisionVideos :: [URL]
      }
  | Lecture
      { slot :: Slot,
        slidesFile' :: Either DateString SlidesPath,
        lectureRecording :: Maybe URL
      }
  | LectureExtra {videoLink :: String}
  | SetupLab {setupLink :: URL}
  | Worksheet {file :: String}
  | WorksheetBonus {file :: String}
  | History
  | NotesExtra
  | Coursework
      { instructions :: String,
        submissionLink :: URL,
        deadline :: String
      }
  | FormativePractical {file :: String}
  | MockTest {test :: URL}
  | Blank
  deriving (Show, Eq)

data Slot = First | Second | Other String deriving (Show, Eq, Ord)

type DateString = String

data SlidesPath
  = BBCode FilePath
  | External URL
  | NoTemplate
  deriving (Show, Eq)

data Material = MkMaterial
  { name :: String,
    link :: URL
  }
  deriving (Show, Eq, Ord)

data Category = MkCat
  { title :: String,
    colour :: Colour,
    counter :: Bool,
    slidesLinkName :: String,
    materialLinkName :: String
  }
  deriving (Show, Eq, Ord)

data Config = MkConfig
  { currentWeek :: Int, -- current week [releases content fully visible up to this week]
    activityNum :: Int, -- number of activities per week (empty slots possible)
    columnNum :: Int, -- desired columns per week (yet autofitted to max 2 rows per week)
    title :: String, -- content title (different to unitName since multiple content streams maybe in one unit)
    headerOn :: Bool, -- table column headers on(=1) or off(=0) min of 4 columns needed to render
    header1 :: String, -- leftmost 1x column header
    header2 :: String, -- middle 2x column header
    header3 :: String, -- rest of the columns header
    inactColour :: Colour, -- font colour for inactive content
    titleColour :: Colour, -- table title colour
    titleBColour :: Colour, -- table title background colour
    bkgColour :: Colour, -- table border background colour
    embossColour :: Colour, -- table border emboss colour
    fontSizePix :: Int -- font size in pixels
    --    extendCatNum1 :: Int     -- number of one category that has no border to above cell (e.g. for multi-week coursework)
    --    extendCatNum2 :: Int     -- number of one category that has no border to above cell (e.g. for multi-week empty)
  }
  deriving (Show)

-- extendCatNum1 and extendCatNum2 should ideally be generated

-- Type synonyms
type CategoryDict = Map Category Int

type Page = [Week]

type Week = [GridEntry]

type URL = String

type Colour = String

-- Utility types for compiling to Javascript

data Activity = MkActivity
  { categoryNum :: Int,
    dateTime :: String,
    title :: String,
    activityURL :: String,
    slidesURL :: String,
    materialStart :: Int,
    materialRange :: Int
  }
  deriving (Show, Eq, Ord)

data ActivitiesMaterials = MkAM ![Activity] ![Material]
  deriving (Show, Eq, Ord)

instance Semigroup ActivitiesMaterials where
  (MkAM a1s m1s) <> (MkAM a2s m2s) = MkAM (a1s ++ a2s') (m1s ++ m2s)
    where
      a2s' = map (adjustIndex (length m1s)) a2s
      adjustIndex n activity@(MkActivity {materialRange, materialStart})
        | materialRange > 0 = activity {materialStart = materialStart + n}
        | otherwise = activity -- If no materials, don't increment start. Makes diffs cleaner

instance Monoid ActivitiesMaterials where
  mempty = MkAM [] []

---------------------------------------------------------------------
-- Smart constructors
---------------------------------------------------------------------

-- Materials

note :: String -> String -> Material
note name file = MkMaterial name (noteLink file)

note' :: String -> Material
note' file = MkMaterial file (noteLink file)

code :: String -> Material
code file = MkMaterial file (codeLink file)

coursework :: String -> String -> Material
coursework cwDir file = MkMaterial file (courseworkLink (cwDir ++ "/" ++ file))

external :: String -> URL -> Material
external = MkMaterial

misc :: String -> Material
misc file = MkMaterial file (miscLink file)

minSheet :: URL -> Material
minSheet = MkMaterial "Minute Sheet"

sheet :: String -> Material
sheet file = MkMaterial file (sheetLink file)

sheets :: Int -> [Material]
sheets i =
  map
    sheet
    [ printf "sheet%02d.pdf" i,
      printf "sheet%02dDyslexic.pdf" i
    ]

answers :: Int -> [Material]
answers i =
  map
    sheet
    [ printf "answer%02d.pdf" i,
      printf "answer%02dDyslexic.pdf" i,
      printf "code%02d.hs" i
    ]

sheetsBonus :: Int -> [Material]
sheetsBonus i =
  map
    sheet
    [ printf "sheetBonus%01d.pdf" i,
      printf "sheetBonus%01dDyslexic.pdf" i
    ]

answersBonus :: Int -> [Material]
answersBonus i =
  map
    sheet
    [ printf "answerBonus%01d.pdf" i,
      printf "answerBonus%01dDyslexic.pdf" i
    ]

-- Link construction

bbRootDir :: URL
bbRootDir = "https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/"

websiteRootDir :: URL
websiteRootDir = "https://uob-coms10016.github.io/2026/"


comingSoonPage :: URL
comingSoonPage = "" -- funcRootDir ++ "coming-soon.html"

funcRootDir :: URL
funcRootDir = bbRootDir ++ "content/functional/"

dir :: String -> String -> URL
dir folder path = funcRootDir ++ folder ++ "/" ++ path

sheetLink :: String -> URL
sheetLink = dir "sheets"

noteLink :: String -> URL
noteLink = dir "notes"

notFoundPage :: URL
notFoundPage = "404.html"

notYetImplemented :: DateString -> URL
notYetImplemented d = "501.html?d=" ++ d

noTemplatePage :: URL
noTemplatePage = "no-template.html"

slidesPathToUrl :: SlidesPath -> URL
slidesPathToUrl slidesFile =
  case slidesFile of
    BBCode path -> codeLink path
    External url -> url
    NoTemplate   -> noTemplatePage

codeLink :: String -> URL
codeLink = dir "code"

courseworkLink :: String -> URL
courseworkLink = dir "coursework"

miscLink :: String -> URL
miscLink = dir "misc"

-- Grid entries

blankEntry :: GridEntry
blankEntry = Entry "" Blank []

-- Categories

simpleCat :: String -> Colour -> Category
simpleCat title colour =
  MkCat
    { title = title,
      colour = colour,
      counter = False,
      slidesLinkName = "",
      materialLinkName = ""
    }

---------------------------------------------------------------------
-- Compilation machinery
---------------------------------------------------------------------

genCategoryDict :: Page -> CategoryDict
genCategoryDict page =
  concat page
    |> map entryToCategory
    |> nub
    |> (`zip` [1 ..])
    |> M.fromList
    |> M.insert blankCategory 0

genActivitiesAndMaterials ::
  Page ->
  CategoryDict ->
  Config ->
  ActivitiesMaterials
genActivitiesAndMaterials page catDict config =
  map genPerWeek page
    |> mconcat
  where
    genPerWeek :: Week -> ActivitiesMaterials
    genPerWeek gridEntries =
      [e1, e2, e3, e4, e5, e6, e7, e8]
        |> map genPerEntry
        |> mconcat
      where
        ([e1, e5], [e2, e3, e6, e7], [e4, e8]) = (pad 2 exercises, pad 4 lectures, pad 2 coursework)
        (exercises, lectures, coursework) = foldr splitIntoSections ([], [], []) gridEntries

        splitIntoSections entry@(Entry {spec}) (ex, lecs, cws)
          | isLectureCategory spec = (ex, entry : lecs, cws)
          | isCourseworkCategory spec = (ex, lecs, entry : cws)
          | otherwise = (entry : ex, lecs, cws)

        pad :: Int -> [GridEntry] -> [GridEntry]
        pad n xs = take n $ xs ++ repeat blankEntry

    genPerEntry :: GridEntry -> ActivitiesMaterials
    genPerEntry entry = MkAM [entryToActivity catDict entry] (materials entry)

pageToJS :: Page -> Config -> String
pageToJS page config =
  unlines
    [ configToJS config,
      categoriesToJS catDict,
      activitiesToJS activities,
      materialsToJS materials
    ]
  where
    catDict = genCategoryDict page
    MkAM activities materials =
      genActivitiesAndMaterials page catDict config

configToJS :: Config -> String
configToJS MkConfig {..} =
  [ ("currentWeek  ", show currentWeek),
    ("activityNum  ", show activityNum),
    ("columnNum    ", show columnNum),
    ("title        ", show title),
    ("headerOn     ", if headerOn then "1" else "0"),
    ("header1      ", show header1),
    ("header2      ", show header2),
    ("header3      ", show header3),
    ("inactColour  ", show inactColour),
    ("titleColour  ", show titleColour),
    ("titleBColour ", show titleBColour),
    ("bkgColour    ", show bkgColour),
    ("embossColour ", show embossColour),
    ("fontSizePix  ", show fontSizePix),
    ("extendCatNum1", "-1"),
    ("extendCatNum2", "-1")
  ]
    |> map (\(name, val) -> "const " ++ name ++ " = " ++ val ++ ";")
    |> unlines

categoriesToJS :: CategoryDict -> String
categoriesToJS catDict =
  unlines
    [ "var categories = [",
      M.toList catDict
        |> sortOn snd
        |> map (\(MkCat {..}, index) -> listToJSArray [show index, title, colour, if counter then "1" else "0", slidesLinkName, materialLinkName])
        |> unlines,
      "];"
    ]

listToJSArray :: [String] -> String
listToJSArray xs = "[" ++ foldr f "" xs ++ "],"
  where
    f listItem acc = show listItem ++ "," ++ acc

activitiesToJS :: [Activity] -> String
activitiesToJS activities =
  unlines
    [ "const activities = [",
      activities
        |> map
          ( \MkActivity {..} ->
              listToJSArray
                [show categoryNum, dateTime, title, activityURL, slidesURL, show materialStart, show materialRange]
          )
        |> unlines,
      "];"
    ]

materialsToJS :: [Material] -> String
materialsToJS materials =
  unlines
    [ "const files = [",
      zipWith materialToJS [0 ..] materials
        |> unlines,
      "];"
    ]

materialToJS :: Int -> Material -> String
materialToJS index MkMaterial {..} =
  listToJSArray [show index, link, name]

---------------------------------------------------------------------
-- Utility Functions
---------------------------------------------------------------------

infixl 0 |>

(|>) :: a -> (a -> b) -> b
x |> f = f x
