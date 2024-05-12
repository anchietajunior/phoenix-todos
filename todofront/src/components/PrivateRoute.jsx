import React from 'react'
import { Navigate } from 'react-router-dom'
import { isAuthenticated } from '../services/auth'

const PrivateRoute = ({ element }) => {
  return isAuthenticated() ? element : <Navigate to="/signin" />
};

export default PrivateRoute