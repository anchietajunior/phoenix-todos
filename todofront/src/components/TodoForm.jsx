import React, { useState, useEffect, useRef } from 'react'

const TodoForm = ({ onSubmit, initialData = {} }) => {
  const [title, setTitle] = useState('')
  const [status, setStatus] = useState(false)
  const [error, setError] = useState(null)
  const isInitialMount = useRef(true)

  useEffect(() => {
    if (isInitialMount.current) {
      if (initialData) {
        setTitle(initialData.title || '')
        setStatus(initialData.status || false)
      }
      isInitialMount.current = false
    }
  }, [initialData])

  const handleSubmit = async (e) => {
    e.preventDefault()
    try {
      await onSubmit({ title, status })
    } catch (err) {
      setError(err.message)
    }
  }

  return (
    <div>
      <h1>{initialData.id ? 'Edit Todo' : 'Create Todo'}</h1>
      {error && <div style={{ color: 'red' }}>{error}</div>}
      <form onSubmit={handleSubmit}>
        <div>
          <label>Title:</label>
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            required
          />
        </div>
        <div>
          <label>Status:</label>
          <input
            type="checkbox"
            checked={status}
            onChange={(e) => setStatus(e.target.checked)}
          />
        </div>
        <button type="submit">{initialData.id ? 'Update' : 'Create'}</button>
      </form>
    </div>
  )
}

export default TodoForm
