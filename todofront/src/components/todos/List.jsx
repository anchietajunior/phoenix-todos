import { useEffect, useState } from 'react'
import { getTodos } from '../../services/api'

const List = ({ onEdit }) => {
  const [todos, setTodos] = useState([])

  useEffect(() => {
    const fetchTodos = async () => {
      const todos = await getTodos()
      setTodos(todos)
    }
    fetchTodos()
  }, [])

  const handleDelete = async (id) => {
    await deleteTodo(id);
    setTodos(todos.filter((todo) => todo.id !== id))
  };

  return (
    <ul className='todos-list'>
      {todos.map((todo) => (
        <li key={todo.id}>
          <span>{todo.title}</span>
          {/* <button onClick={() => onEdit(todo)}>Edit</button>
          <button onClick={() => handleDelete(todo.id)}>Delete</button> */}
        </li>
      ))}
    </ul>
  )
}

export default List