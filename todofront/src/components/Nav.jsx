import React from "react"
import { Link } from "react-router-dom"
import { useAuth } from "../context/AuthContext"
import { useNavigate } from "react-router-dom"

function Nav() {
  const { loggedIn, logout } = useAuth()
  const navigate = useNavigate()

  const handleLogout = () => {
    logout(navigate)
  }

  return (
    <nav>
      {loggedIn ? (
        <>
          <Link to="/todos" className="navlink">Todos</Link>
          <button onClick={handleLogout} className="navlink">Logout</button>
        </>
      ) : (
        <Link to="/signin" className="navlink">Signin</Link>
      )}
    </nav>
  )
}

export default Nav
