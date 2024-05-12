import { Link } from "react-router-dom"

function Nav() {
  return(
    <nav>
      <Link to="/todos" className="navlink">Todos</Link>
      <Link to="/signin" className="navlink">Sigin</Link>
    </nav>
  )
}

export default Nav