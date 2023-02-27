const start = (loading) => () => {
  loading.value = true
}

const finish = (loading) => () => {
  loading.value = false
}

export const useLoad = () => {
  const loading = useState('loading', () => false)
  return {
    loading,
    start: start(loading),
    finish: finish(loading),
  }
}