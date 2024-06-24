let runningTotal = 0;
let buffer = "0";
let PreviousOperator;

const tela = document.querySelector('.tela');

function buttonClick(value){
    if(isNaN(value)){
        handleSymbol(value);
    }else{
        handleNumber(value);
    }
    tela.innerText = buffer;
}

function handleSymbol(symbol){
    switch(symbol){
        case 'C':
            buffer = '0';
            runningTotal = 0;
            break;
        case '=':
            if(PreviousOperator === null){
                return
            }
            flushOperation(parseInt(buffer));
            PreviousOperator = null;
            buffer = runningTotal;
            break;
        case '←':
            if(buffer,lenght === 1){
                buffer = '0';
            }else{
                buffer = buffer.toString(0, buffer.lenght -1);
            }
            break;
        case '+':
        case '-':
        case '×':
        case '÷':
            handleMath(symbol);
            break;

    }
}

function handleMath(symbol){
    if (buffer === '0'){
        return
    }

    const intBuffer = parseInt(buffer);

    if(runningTotal === 0){
        runningTotal = intBuffer;
    }else{
        flushOperation(intBuffer);
    }
    PreviousOperator = symbol;
    buffer = "0";
}

function flushOperation(intBuffer){
    if(PreviousOperator === '+'){
        runningTotal += intBuffer;
    }else if (PreviousOperator === '-'){
        runningTotal -= intBuffer;
    }else if(PreviousOperator === '×'){
        runningTotal *= intBuffer;
    }else if(PreviousOperator === '÷'){
        runningTotal /= intBuffer;
    }
}

function handleNumber(numberString){
    if(buffer === 0){
        buffer = numberString;
    }else{
        buffer+=numberString;
    }
}

function init(){
    document.querySelector('.calc-buttons').addEventListener('click',function(event){
        buttonClick(event.target.innerText);
    })
}

init();