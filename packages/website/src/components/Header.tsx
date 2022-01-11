import { css } from "@emotion/react";
import styled from "@emotion/styled";
import { Link as ReactRouterLink, useLocation } from "react-router-dom";

const headerStyle = css({
  display: "flex",
  position: "sticky",
  alignItems: "center",
});

const navStyle = css({
  display: "grid",
  gridAutoFlow: "column",
  gridGap: "0.5rem",
  alignItems: "center",
  fontWeight: 700,
  fontSize: "1.125rem",
});

const linkStyle = (props: { active: boolean }) =>
  css({
    padding: "0.5rem 2rem",
    borderRadius: "0.5rem",
    backgroundColor: props.active ? "rgb(229,231,235)" : "inherit",
    textDecoration: "inherit",
    color: "inherit",
  });

const Link = styled(ReactRouterLink)`
  ${linkStyle}
`;

const Header = () => {
  const { pathname } = useLocation();

  return (
    <header css={headerStyle}>
      <nav css={navStyle}>
        <Link to="/" active={pathname === "/"}>
          About
        </Link>
        <Link to="/blogs" active={pathname === "/blogs"}>
          Blogs
        </Link>
      </nav>
      <div></div>
    </header>
  );
};

export default Header;