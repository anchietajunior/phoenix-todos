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
	console.log(response)
  localStorage.setItem('todoapitoken', response.data.data.token)
  return response.data
}

export const getInfo = async () => {
  const response = await api.get('/')
  return response.data
}

export const getTodos = async () => {
  const response = await api.get('/todos');
  return response.data.data
};