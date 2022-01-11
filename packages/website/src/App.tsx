import { Routes, Route } from "react-router-dom";

import { ThemeProvider } from "@emotion/react";

import { light } from "./themes";
import Header from "./components/Header";
import Home from "./views/Home";
import Layout from "./components/Layout";

function App() {
  return (
    <ThemeProvider theme={light}>
      <Layout>
        <>
          <Header />
          <Routes>
            <Route path="/" element={<Home />} />
          </Routes>
        </>
      </Layout>
    </ThemeProvider>
  );
}

export default App;
