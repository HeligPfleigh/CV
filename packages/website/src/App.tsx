import { Routes, Route, useLocation } from "react-router-dom";
import { ThemeProvider } from "@emotion/react";
import ProgressBar from "@badrap/bar-of-progress";
import { useEffect, useRef } from "react";

import { light } from "./themes";
import Header from "./components/Header";
import Home from "./views/Home";
import Layout from "./components/Layout";

function App() {
  const { pathname } = useLocation();
  const progressRef = useRef(new ProgressBar());

  useEffect(() => {
    progressRef.current.start();
    const progressTimeout = setTimeout(() => {
      progressRef.current.finish();
    }, 200);
    return () => {
      clearTimeout(progressTimeout);
    };
  }, [pathname]);

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
