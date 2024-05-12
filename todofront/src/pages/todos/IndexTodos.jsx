import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { getTodos } from '../../services/api'

function IndexTodos() {
    const [todos, setTodos] = useState([])

    useEffect(() => {
        const fetchTodos = async () => {
          const todos = await getTodos()
          setTodos(todos)
        }
        fetchTodos()
      }, [])

      return (
        <>
            <h1>Todos List</h1>
            <ul className='todos-list'>
            {todos.map((todo) => (
                <li key={todo.id}>
                  <Link to={`/todos/${todo.id}`}>{todo.title}</Link>
                </li>
            ))}
            </ul>
        </>
      )
  }
  
  export default IndexTodos
  