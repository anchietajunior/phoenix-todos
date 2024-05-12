import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { getTodos, deleteTodo } from '../../services/api'

function IndexTodos() {
  const [todos, setTodos] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    const fetchTodos = async () => {
      const todos = await getTodos()
      setTodos(todos)
    }
    fetchTodos()
  }, [])

    const handleDelete = async (id) => {
      if (window.confirm('Are you sure you want to delete this todo?')) {
        try {
          await deleteTodo(id)
          setTodos(todos.filter((todo) => todo.id !== id))
        } catch (err) {
          setError(err.message)
        }
      }
    }

    return (
      <>
        <h1>Todos List</h1>
        <Link to="/todos/new" className="newlink">Create Todo</Link>
        <ul className='todos-list'>
        {todos.map((todo) => (
            <li key={todo.id}>
              <Link to={`/todos/${todo.id}`}>{todo.title}</Link>
              <button onClick={() => handleDelete(todo.id)}>Delete</button>
            </li>
        ))}
        </ul>
      </>
    )
  }
  
  export default IndexTodos
  