var chinese = ["忍","耐","是","一","种","美","德","。"];
var pinyin = ["Rěn", "nài ", "shì ", "yì", "zhǒng ", "měi", "dé", "."];
var englishTrans = 'Patience is a virtue.';
var instructions = 'Welcome to the <strong>Pinyin</strong><strong class="incorrect">Type</strong> prototype. To use this app, you must enable <a id="input-link" href="https://chinese.yabla.com/type-chinese-characters.php?" target="_blank">pinyin keyboard input</a> on your operating system and know the basics of its usage. After this, click on the Chinese characters and start typing. You can toggle the pinyin <strong class="correct">on</strong> and <strong class="incorrect">off</strong>, off if you really want a challenge! <strong class="incorrect">Use Firefox on OS X for best results.</strong>';
var tonelessPinyin = ["rennai", "shi", "yizhong", "meide"];
var charsPerPhrase = [2, 1, 1, 2, 1, 2, 1, 1];
var pending = 1;
$('#userText').attr('maxLength', chinese.length);

function createDefaultSentences(){
    createChineseSentence();
    createPinyinSentence();
    createEnglishSentence();
}

function createChineseSentence(){
    document.getElementById("chinese-sentence").innerHTML = null;
    for (var i = 0, len = chinese.length; i < len; i++) {
        $('<span>' + chinese[i] + '</span>').appendTo('#chinese-sentence');
    }
}

function createPinyinSentence(){
    document.getElementById("pinyin-sentence").innerHTML = null;
    for (var i = 0, len = pinyin.length; i < len; i++) {
        $('<span>' + pinyin[i] + '</span>').appendTo('#pinyin-sentence');
    }
}

function createEnglishSentence(){
    document.getElementById("english-sentence").innerHTML = englishTrans;
}

function createInstructions(){
    document.getElementById("instructions").innerHTML = instructions;
}

function colorCharByClass(parent_id, position, correctness){
    $(parent_id + " span:nth-child(" + (position + 1) + ")" ).addClass(correctness);
}

function colorCorrect(i){
    colorCharByClass("#chinese-sentence", i, "correct");
    colorCharByClass("#pinyin-sentence", i, "correct");

}
function colorIncorrect(i){
    colorCharByClass("#chinese-sentence", i, "incorrect");
    colorCharByClass("#pinyin-sentence", i, "incorrect");
}

function colorPending(){
    for (var i = 1; i <= charsPerPhrase[pending - 1]; i++){
        colorCharByClass("#chinese-sentence", pending - 2 + i, "pending");
        colorCharByClass("#pinyin-sentence", pending - 2 + i, "pending");
    }
}

function colorSentence(){
    pending = 1;
    var user_input = document.getElementById("userText");
    user_chars = user_input.value;
    createDefaultSentences();
    for (var i = 0; i < user_chars.length; i++) {
        if (chinese[i] == user_chars[i]) {
            colorCorrect(i);
            pending = i + 2;
        } else {
            colorIncorrect(i);
            pending = i + 1;
        }
    }
}

$(document).click(function(e){
    if(e.target.id == "cursor-sensor"){
        colorPending();
        $("#userText").focus();
        console.log('focused');
    }
    else{
        colorSentence();
        console.log('not focused');
    }
});

function handleClick(cb) {
    $("#pinyin-sentence").toggle("show",0);
}

window.onscroll = function () {
    window.scrollTo(0,0);
}

$('body').css('overflow-x', 'hidden');

$(document).ready(function (){
    createDefaultSentences();
    bootbox.alert(instructions)
    $('a.button-toggle').click(function() {
        $("#pinyin-sentence").toggle("show",0);
    });
    $("body").addClass("noscroll");

    $("#userText").keydown(function() {
        this.colorPending;
        console.log('key down');
    });

    $("#userText").keyup(function() {
        this.colorSentence;
        $(':focus').blur();
        $("#userText").focus();
        console.log('key up');
    });
});
