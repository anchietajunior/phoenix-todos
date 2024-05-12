import React, { createContext, useContext, useState } from 'react'
import { login as loginService, logout as logoutService } from '../services/api'

const AuthContext = createContext()

export const useAuth = () => {
  return useContext(AuthContext)
}

export const AuthProvider = ({ children }) => {
  const [loggedIn, setLoggedIn] = useState(!!localStorage.getItem('todoapitoken'))

  const login = async (email, password) => {
    await loginService(email, password)
    setLoggedIn(true)
  }

  const logout = (navigate) => {
    logoutService()
    setLoggedIn(false)
    navigate('/')
  }

  return (
    <AuthContext.Provider value={{ loggedIn, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}
