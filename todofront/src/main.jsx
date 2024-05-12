import React from 'react'
import ReactDOM from 'react-dom/client'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom"

import App from "./App"
import Error from "./pages/Error"
import Login from "./pages/Login"
import Todos from "./pages/Todos"

import './index.css'

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    // errorElement: <Error />,
    children: [
      {
        path: "/signin",
        element: <Login />,
      },
      {
        path: "/todos",
        element: <Todos />,
      }
    ]
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
