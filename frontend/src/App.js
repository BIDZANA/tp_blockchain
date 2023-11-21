import React, { useEffect, useState } from 'react';
import Web3 from 'web3';

function App() {
  const [account, setAccount] = useState('');

  useEffect(() => {
    async function loadWeb3() {
      if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
        await window.ethereum.enable();
      } else if (window.web3) {
        window.web3 = new Web3(window.web3.currentProvider);
      } else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
      }
    }

    async function loadAccount() {
      const accounts = await window.web3.eth.getAccounts();
      setAccount(accounts[0]);
    }

    loadWeb3();
    loadAccount();
  }, []);

  return (
    <div className="App">
      <h1>My Ethereum React App</h1>
      <p>Connected Account: {account}</p>
      {/* Add your smart contract interaction code here */}
    </div>
  );
}

export default App;
