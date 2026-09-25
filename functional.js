const currentWeek   = 2;
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
["4","Lecture","#CCCFFF","0","","Materials",],
["5","Worksheet","#EEEEDD","1","","Materials",],

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
["4","Tues 15:00-17:00<br/>CHEM BLDG LT1","Pattern Matching and Recursion","501.html?d=2026-09-30","","8","3",],
["4","Thur 15:00-16:00<br/>CHEM BLDG LT1","Types","501.html?d=2026-10-02","","11","2",],
["5","Wed 9:00-11:00<br/>MVB2.11/2.34/1.15","Basic Programming","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01.pdf","","13","2",],
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
["9","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/RecursionTemplate.hs","RecursionTemplate.hs",],
["10","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/BeautyOfRecursion.png","BeautyOfRecursion.png",],
["11","https://forms.cloud.microsoft/e/BpZuXP2fVc","Minute Sheet",],
["12","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/code/TypesTemplate.hs","TypesTemplate.hs",],
["13","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01.pdf","sheet01.pdf",],
["14","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2026_TB-1/content/functional/sheets/sheet01Dyslexic.pdf","sheet01Dyslexic.pdf",],

];

