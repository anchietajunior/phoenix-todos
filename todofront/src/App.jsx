import { useEffect, useState } from 'react'
import './App.css'
import { Outlet } from 'react-router-dom'

import { getInfo } from './services/api'

import Nav from "./components/Nav"

function App() {
  const [info, setInfo] = useState([])

  useEffect(() => {
    const fetchInfo = async () => {
      const info = await getInfo();
      setInfo(info);
    };
    fetchInfo();
    console.log(info)
  }, [])

  return (
    <>
      <Nav />
      <h1>Todos app with Phoenix + React</h1>
      <Outlet />
    </>
  )
}

export default App
