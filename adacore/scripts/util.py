import os


def makedirs_allow_exists(dirname):
    try:
        os.makedirs(dirname)
    except FileExistsError:
        pass
    except Exception as err:
        print(f"Unexpected {err=}, {type(err)=}")
        raise
