const currentWeek   = 4;
const activityNum   = 8;
const columnNum     = 4;
const title         = "FUNCTIONAL PROGRAMMING";
const headerOn      = 1;
const header1       = "EXERCISES";
const header2       = "LECTURES";
const header3       = "COURSEWORK";
const inactColour   = "#999999";
const titleColour   = "#777777";
const titleBColour  = "#BBBBBB";
const bkgColour     = "#CCCCCC";
const embossColour  = "#AAAAAA";
const fontSizePix   = 11;
const extendCatNum1 = -1;
const extendCatNum2 = -1;

var categories = [
["0","","#CCCCCC","0","","",],
["1","Extra Materials","#DDDDDD","0","","Materials",],
["2","Lecture","#CCCFFF","0","Lecture Recording","Materials",],
["3","Setup Lab:","#EEEEDD","0","","",],
["4","Worksheet","#EEEEDD","1","","Materials",],
["5","History","#EEEEDD","0","","Materials",],
["6","Lecture","#CCCFFF","0","","Materials",],
["7","Formative Practical","#EEEEDD","1","","Materials",],

];

const activities = [
["1","(optional)","","","","0","1",],
["2","Tues 15:00-17:00<br/>CHEM BLDG LT1","Introduction + Expressions and Evaluation","https://docs.google.com/presentation/d/1DiapOoijfu_mNmz7vajflsmM7kC2c4-IdmqEzG0nKRM","https://mediasite.bris.ac.uk/Mediasite/Play/a0ce3259bfc6444a8768d6942750dfd61d","1","4",],
["2","Thur 15:00-16:00<br/>CHEM BLDG LT1","Expressions and Evaluation (cont.)","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ExpressionsBP.hs","https://mediasite.bris.ac.uk/Mediasite/Play/0f1a125fbd6340ab97cc998f6d28816d1d","5","3",],
["3","Mon 21/09/26<br/>15:00-18:00<br/>Wed 23/09/26<br/>9:00-11:00<br/>MVB2.11/2.34/1.15","GET YOUR PC READY","./setup.html","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["2","Tues 15:00-17:00<br/>CHEM BLDG LT1","Pattern Matching and Recursion","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/Lecture2MasterBP.hs","https://mediasite.bris.ac.uk/Mediasite/Play/5f28bc1639f44aaf98503ea06ba7ef7f1d","8","8",],
["2","Thur 15:00-16:00<br/>CHEM BLDG LT1","Types","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/TypesBP.hs","https://mediasite.bris.ac.uk/Mediasite/Play/8ecca352d79c489899deb2f7a80c0d851d","16","4",],
["4","Wed 9:00-11:00<br/>MVB2.11/2.34/1.15","Basic Programming","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01.pdf","","20","5",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["5","(optional)","History of Haskell","","","25","2",],
["2","Tues 15:00-17:00<br/>CHEM BLDG LT1","Lists","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListsBP.hs","https://mediasite.bris.ac.uk/Mediasite/Play/7874f438de6b4eea947957515b14ea141d","27","7",],
["6","Thur 15:00-16:00<br/>CHEM BLDG LT1","ADTs","501.html?d=2026-10-10","","34","2",],
["4","Wed 9:00-11:00<br/>MVB2.11/2.34/1.15","Types and Lists","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet02.pdf","","36","5",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["6","Tues 15:00-17:00<br/>CHEM BLDG LT1","Polymorphism and Type Classes","501.html?d=2026-10-14","","41","1",],
["6","Thur 15:00-16:00<br/>CHEM BLDG LT1","Higher-Order Functions","501.html?d=2026-10-16","","42","1",],
["4","Wed 9:00-11:00<br/>MVB2.11/2.34/1.15","ADTs, Polymorphism and Type Classes","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet03.pdf","","43","2",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["7","","Power to the People","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/coursework/Power/Power-Instrs.pdf","","45","3",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],

];

const files = [
["0","https://plrg-bristol.github.io/","Bristol PL Research Group",],
["1","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/misc/Roadmap.pdf","Roadmap.pdf",],
["2","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ExpressionsBP.hs","ExpressionsBP.hs",],
["3","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ExpressionsLive-v0.1.hs","ExpressionsLive-v0.1.hs",],
["4","https://forms.cloud.microsoft/e/w1iprVsbWX","Minute Sheet",],
["5","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ExpressionsBP.hs","ExpressionsBP.hs",],
["6","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ExpressionsLive.hs","ExpressionsLive.hs",],
["7","https://forms.cloud.microsoft/e/QZ62B9rgG8","Minute Sheet",],
["8","https://forms.cloud.microsoft/e/2WYXgw55gE","Minute Sheet",],
["9","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/PatternMatchingTemplate.hs","PatternMatchingTemplate.hs",],
["10","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/PatternMatchingBP.hs","PatternMatchingBP.hs",],
["11","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/PatternMatchingLive.hs","PatternMatchingLive.hs",],
["12","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/RecursionTemplate.hs","RecursionTemplate.hs",],
["13","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/BeautyOfRecursion.png","BeautyOfRecursion.png",],
["14","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/RecursionBP.hs","RecursionBP.hs",],
["15","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/RecursionLive.hs","RecursionLive.hs",],
["16","https://forms.cloud.microsoft/e/BpZuXP2fVc","Minute Sheet",],
["17","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/TypesLive.hs","TypesLive.hs",],
["18","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/TypesTemplate.hs","TypesTemplate.hs",],
["19","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/TypesBP.hs","TypesBP.hs",],
["20","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01.pdf","sheet01.pdf",],
["21","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01Dyslexic.pdf","sheet01Dyslexic.pdf",],
["22","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/answer01.pdf","answer01.pdf",],
["23","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/answer01Dyslexic.pdf","answer01Dyslexic.pdf",],
["24","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/code01.hs","code01.hs",],
["25","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/notes/HistoryOfHaskell.pdf","History of Haskell",],
["26","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/notes/HowFPMattered.pdf","How Functional Programming Mattered",],
["27","https://forms.cloud.microsoft/e/6fkHNR7iaW","Minute Sheet",],
["28","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListsTemplate.hs","ListsTemplate.hs",],
["29","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListsBP.hs","ListsBP.hs",],
["30","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListsLive.hs","ListsLive.hs",],
["31","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/blackboard.jpg","blackboard.jpg",],
["32","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListExamplesBP.hs","ListExamplesBP.hs",],
["33","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ListExamplesLive.hs","ListExamplesLive.hs",],
["34","https://forms.cloud.microsoft/e/6fkHNR7iaW","Minute Sheet",],
["35","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/ADTsTemplate.hs","ADTsTemplate.hs",],
["36","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet02.pdf","sheet02.pdf",],
["37","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet02Dyslexic.pdf","sheet02Dyslexic.pdf",],
["38","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/answer02.pdf","answer02.pdf",],
["39","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/answer02Dyslexic.pdf","answer02Dyslexic.pdf",],
["40","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/code02.hs","code02.hs",],
["41","https://forms.cloud.microsoft/e/p70YZ9AvMK","Minute Sheet",],
["42","https://forms.cloud.microsoft/e/szsFDhzxzC","Minute Sheet",],
["43","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet03.pdf","sheet03.pdf",],
["44","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet03Dyslexic.pdf","sheet03Dyslexic.pdf",],
["45","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/coursework/Power/Power-Instrs.pdf","Power-Instrs.pdf",],
["46","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/coursework/Power/Power-InstrsDyslexic.pdf","Power-InstrsDyslexic.pdf",],
["47","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/coursework/Power/Power-PowerToThePeople.zip","Power-PowerToThePeople.zip",],

];

