import { useEffect, useState } from 'react'
import './App.css'
import { Outlet } from 'react-router-dom'

import { getInfo } from './services/api'

import Nav from "./components/Nav"

function App() {
  const [info, setInfo] = useState([])

  useEffect(() => {
    const fetchInfo = async () => {
      const fetchedInfo = await getInfo()
      setInfo(fetchedInfo)
    }
    fetchInfo()
  }, [])

  return (
    <>
      <p>App name: { info.name } | Version: { info.version }</p>
      <Nav />
      <Outlet />
    </>
  )
}

export default App
