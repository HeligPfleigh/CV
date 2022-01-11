import { css } from "@emotion/react";

import { breakpoints } from "../themes";

const layoutStyle = css({
  padding: "1.5rem",
  [breakpoints.up("sm")]: {
    width: "66%",
    margin: "0 auto",
  },
});

type LayoutProps = {
  children: JSX.Element | JSX.Element[];
};

const Layout: React.FC<LayoutProps> = ({ children }: LayoutProps) => {
  return <div css={layoutStyle}>{children}</div>;
};

export default Layout;
