
// const allTodos = ({state}) => ({
  // Object.keys(state.todos).map(id => state.todos[id])
// });


export const allTodos = ( state ) => (
  Object.keys(state.todos).map(id => state.todos[id])
);


// const newTodos = [
//   { id: 1,
//     title: "do stuff1",
//     body: "with soap",
//     done: false
//   }
// ,
//   { id: 2,
//     title: "do stuff2",
//     body: "with shampoo",
//     done: true}
// ];
