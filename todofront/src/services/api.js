import axios from 'axios'

const api = axios.create({
	baseURL: 'http://localhost:4000/api',
})

api.interceptors.request.use((config) => {
  const token = localStorage.getItem('todoapitoken')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

export const login = async (email, password) => {
  const response = await api.post('/users/sign_in', { email, hash_password: password })
  localStorage.setItem('todoapitoken', response.data.data.token)
  return response.data
}

export const logout = () => {
  localStorage.removeItem('todoapitoken')
}

// INFO

export const getInfo = async () => {
  const response = await api.get('/')
  return response.data
}

// TODOS

export const getTodos = async () => {
  const response = await api.get('/todos');
  return response.data.data
}

export const getTodoById = async (id) => {
  const response = await api.get(`/todos/${id}`)
  return response.data
}

export const createTodo = async (todo) => {
  const response = await api.post('/todos', { todo: todo })
  return response.data
}

export const updateTodo = async (id, todo) => {
  const response = await api.put(`/todos/${id}`, { todo: todo })
  return response.data
}

export const deleteTodo = async (id) => {
  const response = await api.delete(`/todos/${id}`)
  return response.data
}