import {
  VerticalTimeline,
  VerticalTimelineElement,
} from "react-vertical-timeline-component";

import "react-vertical-timeline-component/style.min.css";

const WorkExperience: React.FC = () => {
  return (
    <VerticalTimeline lineColor="blue">
      <VerticalTimelineElement
        className="vertical-timeline-element--work"
        contentStyle={{ background: "rgb(33, 150, 243)", color: "#fff" }}
        contentArrowStyle={{ borderRight: "7px solid  rgb(33, 150, 243)" }}
        date="9/2019 - present"
        iconStyle={{ background: "rgb(33, 150, 243)", color: "#fff" }}
        icon={<div />}
      >
        <h3 className="vertical-timeline-element-title">Frontend Developer</h3>
        <h4 className="vertical-timeline-element-subtitle">Ewoosoft Vietnam</h4>
        <p>TODO</p>
      </VerticalTimelineElement>
      <VerticalTimelineElement
        className="vertical-timeline-element--work"
        date="11/2017 - 9/2019"
        iconStyle={{ background: "rgb(33, 150, 243)", color: "#fff" }}
        icon={<div />}
      >
        <h3 className="vertical-timeline-element-title">Fullstack Developer</h3>
        <h4 className="vertical-timeline-element-subtitle">
          MTT Software Company
        </h4>
        <p>TODO</p>
      </VerticalTimelineElement>
      <VerticalTimelineElement
        className="vertical-timeline-element--work"
        date="4/2016 - 11/2017"
        iconStyle={{ background: "rgb(33, 150, 243)", color: "#fff" }}
        icon={<div />}
      >
        <h3 className="vertical-timeline-element-title">Developer</h3>
        <h4 className="vertical-timeline-element-subtitle">
          Samsung Vietnam Mobile R&D Center
        </h4>
        <p>TODO</p>
      </VerticalTimelineElement>
      <VerticalTimelineElement
        className="vertical-timeline-element--education"
        date="9/2010 - 12/2015"
        iconStyle={{ background: "rgb(233, 30, 99)", color: "#fff" }}
        icon={<div />}
      >
        <h3 className="vertical-timeline-element-title">
          Bachelor of Hanoi University of Science and Technology
        </h3>
        <h4 className="vertical-timeline-element-subtitle">Bachelor Degree</h4>
        <p>TODO</p>
      </VerticalTimelineElement>
      <VerticalTimelineElement
        iconStyle={{ background: "rgb(16, 204, 82)", color: "#fff" }}
        icon={<div />}
      />
    </VerticalTimeline>
  );
};

export default WorkExperience;
