export default function App() {
  const server = import.meta.env.VITE_SERVER_ID || 'UNKNOWN';

  return (
    <main style={{
      fontFamily: 'Arial, sans-serif',
      maxWidth: '700px',
      margin: '80px auto',
      padding: '24px',
      textAlign: 'center'
    }}>
      <h1>Highly Available React Application</h1>
      <p>Your application is running successfully.</p>

      <div style={{
        padding: '20px',
        border: '2px solid #16a34a',
        borderRadius: '12px'
      }}>
        <h2>Server: {server}</h2>
        <p>Managed by systemd</p>
      </div>
    </main>
  );
}
