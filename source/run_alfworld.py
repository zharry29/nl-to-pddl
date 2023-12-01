import numpy as np
import alfworld.agents.environment as environment
import alfworld.agents.modules.generic as generic
import os
import random
random.seed(29)

os.environ["ALFWORLD_DATA"] = "/mnt/c/Users/z_har/OneDrive/Documents/GitHub/alfworld/alfworld_data"


# load config
config = generic.load_config()
env_type = config['env']['type'] # 'AlfredTWEnv' or 'AlfredThorEnv' or 'AlfredHybrid'

# setup environment
env = getattr(environment, env_type)(config, train_eval='train')
env = env.init_env(batch_size=1)

# interact
obs, info = env.reset()
while True:
    # get random actions from admissible 'valid' commands (not available for AlfredThorEnv)
    admissible_commands = list(info['admissible_commands']) # note: BUTLER generates commands word-by-word without using admissible_commands
    random_actions = [np.random.choice(admissible_commands[0])]

    # step
    obs, scores, dones, infos = env.step(random_actions)
    print(infos)
    print(dones)
    print(obs)
    input("Continue?")
    print("Action: {}, Obs: {}".format(random_actions[0], obs[0]))