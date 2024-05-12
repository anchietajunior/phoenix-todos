import React, { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { getTodoById, updateTodo } from '../../services/api'
import TodoForm from '../../components/TodoForm'

const EditTodo = () => {
  const { id } = useParams()
  const [initialData, setInitialData] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const navigate = useNavigate()

  useEffect(() => {
    const fetchTodo = async () => {
      try {
        const data = await getTodoById(id)
        setInitialData(data.data)
        setLoading(false)
      } catch (err) {
        setError(err.message)
        setLoading(false)
      }
    }

    fetchTodo()
  }, [id])

  const handleUpdate = async (todo) => {
    await updateTodo(id, todo)
    navigate(`/todos/${id}`)
  }

  if (loading) return <div>Loading...</div>
  if (error) return <div>Error: {error}</div>

  return <TodoForm onSubmit={handleUpdate} initialData={initialData} />
}

export default EditTodo
