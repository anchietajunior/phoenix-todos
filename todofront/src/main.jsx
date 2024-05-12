import React from 'react'
import ReactDOM from 'react-dom/client'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom"

import App from "./App"
import Error from "./pages/Error"
import Login from "./pages/Login"
import IndexTodos from "./pages/todos/IndexTodos"
import ShowTodo from './pages/todos/ShowTodo'
import PrivateRoute from './components/PrivateRoute'
import { AuthProvider } from './context/AuthContext'

import './index.css'

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    errorElement: <Error />,
    children: [
      {
        path: "/signin",
        element: <Login />,
      },
      {
        path: "/todos",
        element: <PrivateRoute element={<IndexTodos />} />,
      },
      {
        path: "/todos/:id",
        element: <PrivateRoute element={<ShowTodo />} />,
      }
    ]
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <AuthProvider>
      <RouterProvider router={router} />
    </AuthProvider>
  </React.StrictMode>,
)
