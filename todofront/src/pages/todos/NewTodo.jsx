import React from 'react'
import { useNavigate } from 'react-router-dom'
import { createTodo } from '../../services/api'
import TodoForm from '../../components/TodoForm'

const NewTodo = () => {
  const navigate = useNavigate()

  const handleCreate = async (todo) => {
    await createTodo(todo)
    navigate('/todos')
  }

  return <TodoForm onSubmit={handleCreate} />
}

export default NewTodo
