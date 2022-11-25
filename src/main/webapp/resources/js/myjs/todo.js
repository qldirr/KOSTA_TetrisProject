const todoInputElem = document.querySelector('.todo-input');
const todoListElem = document.querySelector('.todo-list');
const completeAllBtnElem = document.querySelector('.complete-all-btn');
const leftItemsElem = document.querySelector('.left-items')
const showAllBtnElem = document.querySelector('.show-all-btn');
const showActiveBtnElem = document.querySelector('.show-active-btn');
const showCompletedBtnElem = document.querySelector('.show-completed-btn');
const clearCompletedBtnElem = document.querySelector('.clear-completed-btn');


let id = 0;
const setId = (newId) => {id = newId};

let isAllCompleted = false; // 전체 todos 체크 여부
const setIsAllCompleted = (bool) => { isAllCompleted = bool};

let currentShowType = 'all'; // all  | active | complete 카테고리
const setCurrentShowType = (newShowType) => currentShowType = newShowType

let todos = [];
const setTodos = (newTodos) => {
    todos = newTodos;
}

const getAllTodos = () => {
    return todos;
}
const getCompletedTodos = () => {
    return todos.filter(todo => todo.isCompleted === true );
}
const getActiveTodos = () => {
    return todos.filter(todo => todo.isCompleted === false);
}

const setLeftItems = () => {
    const leftTodos = getActiveTodos()
    leftItemsElem.innerHTML = `${leftTodos.length} items left`
}

const completeAll = () => {
    completeAllBtnElem.classList.add('checked');
    const newTodos = getAllTodos().map(todo => ({...todo, isCompleted: true }) )
    setTodos(newTodos)
}

const incompleteAll = () => {
    completeAllBtnElem.classList.remove('checked');
    const newTodos =  getAllTodos().map(todo => ({...todo, isCompleted: false }) );
    setTodos(newTodos)
}

// 전체 todos의 check 여부 (isCompleted)
const checkIsAllCompleted = () => {
    if(getAllTodos().length === getCompletedTodos().length ){
        setIsAllCompleted(true);
        completeAllBtnElem.classList.add('checked');
    }else {
        setIsAllCompleted(false);
        completeAllBtnElem.classList.remove('checked');
    }
}

const onClickCompleteAll = () => {
    if(!getAllTodos().length) return; // todos배열의 길이가 0이면 return;

    if(isAllCompleted) incompleteAll(); // isAllCompleted가 true이면 todos를 전체 미완료 처리 
    else completeAll(); // isAllCompleted가 false이면 todos를 전체 완료 처리 
    setIsAllCompleted(!isAllCompleted); // isAllCompleted 토글
    paintTodos(); // 새로운 todos를 렌더링
    setLeftItems()
}

const appendTodos = (text) => {
    const newId = id + 1; // 기존에 i++ 로 작성했던 부분을 setId()를 통해 id값을 갱신하였다.
    setId(newId)
    const newTodos = getAllTodos().concat({id: newId, isCompleted: false, content: text })
    // const newTodos = [...getAllTodos(), {id: newId, isCompleted: false, content: text }]
    setTodos(newTodos)
    setLeftItems()
    checkIsAllCompleted();    //전체 완료 처리 확인
    paintTodos();
}

const deleteTodo = (todoId) => {   
    const newTodos = getAllTodos().filter(todo => todo.id !== todoId );
    setTodos(newTodos);
    setLeftItems()
    paintTodos()
}//입력받은 todo의 id 값과 Array filter()를 이용해 삭제하고자 하는 할 일을 제외한 새로운 할 일 목록을 가지는 배열을 만들 수 있고
// 이를 setTodos()함수를 통해 기존의 todos 배열을 바꿔줌, paintTodos() 함수를 통해 삭제된 todos배열로 다시 HTML를 다시 렌더링

const completeTodo = (todoId) => {
    const newTodos = getAllTodos().map(todo => todo.id === todoId ? {...todo,  isCompleted: !todo.isCompleted} : todo )
    setTodos(newTodos);
    paintTodos();
    setLeftItems()
    checkIsAllCompleted();
}//완료 처리는 Array map()을 사용하여 완료 처리를 하고자 하는 할 일의 isCompleted 값을 토글(true이면 false로, false면 true로) 처리하여 새로운 todos 배열을 저장

const updateTodo = (text, todoId) => {
    const currentTodos = getAllTodos();   //todos 배열을 가져와 map을 통해 id값을 비교하여할 일의 내용을 수정하는 새로운 todos 배열을 만듦
    const newTodos = currentTodos.map(todo => todo.id === todoId ? ({...todo, content: text}) : todo);
    setTodos(newTodos);  //새로운 todos배열을 저장
    paintTodos();
}

const onDbclickTodo = (e, todoId) => {
    const todoElem = e.target;
    const inputText = e.target.innerText;
    const todoItemElem = todoElem.parentNode;
    const inputElem = document.createElement('input');
    inputElem.value = inputText;
    inputElem.classList.add('edit-input');
    inputElem.addEventListener('keypress', (e)=>{
        if(e.key === 'Enter') {
            updateTodo(e.target.value, todoId);   //todo 수정
            document.body.removeEventListener('click', onClickBody );
        }
    })

    const onClickBody = (e) => {    // todoItemElem 요소를 제외한 영역을 클릭 시, 수정모드 종료
        if(e.target !== inputElem)  {
            todoItemElem.removeChild(inputElem);
            document.body.removeEventListener('click', onClickBody );    
        }
    }
    
    document.body.addEventListener('click', onClickBody)   // body에 클릭에 대한 이벤트 리스너 등록
    todoItemElem.appendChild(inputElem);  // todoItemElem 요소에 자식 요소로 inputElem 요소 추가
}

const clearCompletedTodos = () => {
    const newTodos = getActiveTodos()
    setTodos(newTodos)
    paintTodos();
}

const paintTodo = (todo) => {
    const todoItemElem = document.createElement('li');
    todoItemElem.classList.add('todo-item');

    todoItemElem.setAttribute('data-id', todo.id );

    const checkboxElem = document.createElement('div');
    checkboxElem.classList.add('checkbox');
    checkboxElem.addEventListener('click', () => completeTodo(todo.id))

    const todoElem = document.createElement('div');
    todoElem.classList.add('todo');
    todoElem.addEventListener('dblclick', (event) => onDbclickTodo(event, todo.id))
    todoElem.innerText = todo.content;

    const delBtnElem = document.createElement('button');
    delBtnElem.classList.add('delBtn');
    delBtnElem.addEventListener('click', () =>  deleteTodo(todo.id))
    delBtnElem.innerHTML = 'X';

    if(todo.isCompleted) {
        todoItemElem.classList.add('checked');
        checkboxElem.innerText = '✔';
    }

    todoItemElem.appendChild(checkboxElem);
    todoItemElem.appendChild(todoElem);
    todoItemElem.appendChild(delBtnElem);

    todoListElem.appendChild(todoItemElem);
}

const paintTodos = () => {    //기존의 "todo-list"안에 있는 HTML을 초기화
    todoListElem.innerHTML = null;

    switch (currentShowType) {
        case 'all':
            const allTodos = getAllTodos();
            allTodos.forEach(todo => { paintTodo(todo);});
            break;
        case 'active': 
            const activeTodos = getActiveTodos();
            activeTodos.forEach(todo => { paintTodo(todo);});
            break;
        case 'completed': 
            const completedTodos = getCompletedTodos();
            completedTodos.forEach(todo => { paintTodo(todo);});
            break;
        default:
            break;
    }
}

const onClickShowTodosType = (e) => {
    const currentBtnElem = e.target;
    const newShowType = currentBtnElem.dataset.type;

    if ( currentShowType === newShowType ) return;

    const preBtnElem = document.querySelector(`.show-${currentShowType}-btn`);
    preBtnElem.classList.remove('selected');

    currentBtnElem.classList.add('selected')
    setCurrentShowType(newShowType)
    paintTodos();
}

const init = () => {
    todoInputElem.addEventListener('keypress', (e) =>{
        if( e.key === 'Enter' ){
            appendTodos(e.target.value); todoInputElem.value ='';
        }
    })
    completeAllBtnElem.addEventListener('click',  onClickCompleteAll);   // 전체 완료 처리 버튼에 클릭 이벤트 리스너 
    showAllBtnElem.addEventListener('click', onClickShowTodosType);
    showActiveBtnElem.addEventListener('click',onClickShowTodosType);
    showCompletedBtnElem.addEventListener('click',onClickShowTodosType);
    clearCompletedBtnElem.addEventListener('click', clearCompletedTodos);
    setLeftItems()
}

init()