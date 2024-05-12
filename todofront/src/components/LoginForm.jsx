import { useState } from 'react'
import { useNavigate } from "react-router-dom"
import { login } from '../services/api'

function LoginForm() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
	const navigate = useNavigate()

	const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await login(email, password);
			navigate('/todos')
    } catch (error) {
      console.error('Login failed:', error);
      alert('Login failed');
    }
  }

	return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Email:</label>
        <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
      </div>
      <div>
        <label>Password:</label>
        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required />
      </div>
      <button type="submit">Login</button>
    </form>
  )
}

export default LoginForm