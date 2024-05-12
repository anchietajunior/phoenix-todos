import './App.css'
import { Outlet } from 'react-router-dom'

import Nav from "./components/Nav"

function App() {

  return (
    <>
      <Nav />
      <h1>Todos app with Phoenix + React</h1>
      <Outlet />
    </>
  )
}

export default App
