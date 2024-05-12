import React, { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { getTodoById } from '../../services/api'

const ShowTodo = () => {
  const { id } = useParams()
  const [todo, setTodo] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    const fetchTodo = async () => {
      try {
        const data = await getTodoById(id)
        setTodo(data.data)
        setLoading(false)
      } catch (err) {
        setError(err.message)
        setLoading(false)
      }
    }

    fetchTodo()
  }, [id])

  if (loading) return <div>Loading...</div>
  if (error) return <div>Error: {error}</div>

  return (
    <div>
      <h1>Todo Details</h1>
      <Link to={`/todos/${id}/edit`} className="newlink">Edit Todo</Link>
      <Link to={`/todos/`}>List</Link>
      {todo ? (
        <div>
          <p><strong>Title:</strong> {todo.title}</p>
          <p><strong>Status:</strong> {todo.status ? 'Completed' : 'Pending'}</p>
        </div>
      ) : (
        <p>Todo not found</p>
      )}
    </div>
  )
}

export default ShowTodo