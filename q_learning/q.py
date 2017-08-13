import numpy as np
import pandas as pd

class maze(object):
    def __init__(self, state=6, action=6):
        self.s = state
        self.a = action
        self.R = pd.DataFrame(data=-np.ones((self.s, self.a)))
        self.R.get_values()[2,3] = self.R.get_values()[3,2] = 0
        self.R.get_values()[0,4] = self.R.get_values()[4,0] = 0
        self.R.get_values()[1,3] = self.R.get_values()[3,1] = 0
        self.R.get_values()[4,3] = self.R.get_values()[3,4] = 0
        self.R.get_values()[5,1] = self.R.get_values()[5,4] = 0
        self.R.get_values()[1,5] = self.R.get_values()[4,5] = self.R.get_values()[5,5] = 100
        print self.R
    def reset(self):
        self.init_state = np.random.randint(0, self.R.index.size)
        return self.init_state
    def step(self, action):
        self._state = self.init_state
        terminal = False
        if self._state == 5:
            terminal = True
        if self.R.get_values()[self.init_state, action] != -1:
            self.init_state = action
        else:
            print 'action is error!'
        return self.R.get_values()[self._state,self.init_state], self.init_state, terminal

class agent(object):
    def __init__(self, T):
        self.Q = pd.DataFrame(data=np.zeros((6, 6)))
        self.T = T
    def learn(self, reward, state, action):
        self.Q.get_values()[state,action] = r + gama * np.max(self.Q.get_values()[action,:])
        return self.Q
    def choose_action(self, state, state_index):
        if np.random.sample() < self.T or (self.Q.get_values()[state,:]==0).all():
            action = np.random.choice(state_index)
            if self.T > 0: self.T -= 0.002
        else:
            action = self.Q.get_values()[state,:].argmax()
        return action

s = {'0':[4], '1':[3,5], '2':[3], '3':[1,2,4], '4':[0,3,5], '5':[1,4,5]}
robot = agent(T = 0.1)
env = maze(state=6, action=6)
max_episode = 200
i_episode = 300
gama = 0.8
Q = []

for i_episode in range(max_episode):
    init_state = env.reset()
    while(True):
        state_index = s['%s'%init_state]
        action = robot.choose_action(init_state, state_index)
        r, state_next, done = env.step(action)
        Q = robot.learn(r, init_state, action)
        init_state = state_next
        if done:
            break
    i_episode += 1
    if i_episode == max_episode-1:
        print Q