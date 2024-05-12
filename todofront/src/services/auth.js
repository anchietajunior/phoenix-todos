export const isAuthenticated = () => {
	return !!localStorage.getItem('todoapitoken')
}