FROM ros:noetic
RUN apt-get update && apt-get install -y apt-utils ros-noetic-ypspur-ros
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
ENTRYPOINT ["bash", "-c", "source /opt/ros/noetic/setup.bash && exec bash"]