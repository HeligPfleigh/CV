import { Routes, Route, useLocation } from "react-router-dom";
import { css, ThemeProvider } from "@emotion/react";
import ProgressBar from "@badrap/bar-of-progress";
import { useEffect, useRef } from "react";

import { light } from "./themes";
import Header from "./components/Header";
import Layout from "./components/Layout";
import Home from "./views/Home";
import WorkExperience from "./views/WorkExperience";

const mainStyle = css({
  padding: "1.5rem",
  marginTop: "3rem",
});

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
        <Header />
        <main css={mainStyle}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/works" element={<WorkExperience />} />
          </Routes>
        </main>
      </Layout>
    </ThemeProvider>
  );
}

export default App;
